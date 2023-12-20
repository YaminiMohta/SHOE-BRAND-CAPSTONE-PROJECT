#!/usr/bin/env python
# coding: utf-8

# # Phase 3  

# In[ ]:





# In[7]:


import pandas as pd


# In[8]:


df1=pd.read_csv('Table1.csv')
df2=pd.read_csv('Table2.csv')
df3=pd.read_csv('Table3.csv')


# In[9]:


Result_df=pd.merge(df1, df2)


# In[10]:


DF=pd.merge(Result_df, df3)


# In[11]:


DF


# In[12]:


DF.to_csv('Table4.csv')
DF=pd.read_csv('Table4.csv')


# In[13]:


data = pd.read_csv('Table4.csv')


# In[14]:


data


# In[ ]:





# In[ ]:





# In[15]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt  #Data Visualization
get_ipython().run_line_magic('matplotlib', 'inline')
import seaborn as sns


# In[7]:


DF.info()


# In[8]:


DF.drop(['Unnamed: 0'], axis=1, inplace=True)


# In[9]:


pd.isnull(DF).sum()


# In[10]:


DF['Shoe_Price']=DF['Shoe_Price'].astype('int')


# In[11]:


DF.info()


# In[12]:


DF.describe()


# In[13]:


DF.columns


# In[ ]:





# #PieChart for the star rating for shoes where it seems that most of the shoes fall between range of 4-5 on star rating, and approx 25% of shoes do not have any reviews.

# In[14]:


Star_Rate_counts = DF['Star_rating'].value_counts()
plt.pie(Star_Rate_counts, labels=Star_Rate_counts.index)
plt.axis('equal')
plt.title('Distribution of star_ratings')
plt.show()


# In[ ]:





# #After conducting a comprehensive analysis of the comfort ratings for various shoe models, it is evident that a majority of the surveyed customers highly favor and praise the exceptional comfort levels

# In[15]:


Comfort_counts = DF['Comfort'].value_counts()
plt.pie(Comfort_counts, labels=Comfort_counts.index)
plt.axis('equal')
plt.title('Distribution of Comfort_counts')
plt.show()


# In[ ]:





# #Chart showing data of star rating and shoe prices.

# In[16]:


sns.barplot(x='Star_rating', y='Shoe_Price', data=DF)


# In[ ]:





# #The top 10 shoes with the highest prices showcase premium quality, exquisite designs, and exclusive features, appealing to a luxury-seeking consumer base.

# In[21]:


top_shoes = DF.groupby(['Shoename'], as_index=False)['Shoe_Price'].sum().sort_values(by='Shoe_Price', ascending=False).head(10)
sns.barplot(data=top_shoes, x='Shoe_Price', y='Shoename')


# In[ ]:





# #After the analysis that we made, it is clear that as the price of the shoe increases the comfort level also increases and demonstrates a positive relationship.

# In[23]:


sns.barplot(y='Comfort', x='Shoe_Price', data=DF)


# In[ ]:





# In[ ]:





# # Phase 4

# In[ ]:





# In[16]:


import pandas as pd
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.preprocessing import StandardScaler
from sklearn.ensemble import RandomForestRegressor, RandomForestClassifier
from sklearn.metrics import mean_squared_error, accuracy_score
import joblib


# In[17]:


data


# In[18]:


X_price= data.drop(['Shoe_Price'], axis=1)
Y_price= data['Shoe_Price']


# In[19]:


X_rating= data.drop(['Star_rating'], axis=1)
Y_rating= data['Star_rating']


# In[20]:


X_price_train, X_price_test, Y_price_train, Y_price_test=train_test_split(X_price, Y_price, test_size=0.2, random_state=42)
X_rating_train, X_rating_test, Y_rating_train, Y_rating_test=train_test_split(X_rating, Y_rating, test_size=0.2, random_state=42)


# In[21]:


scaler = StandardScaler()
X_price_train_scaled = scaler.fit_transform(X_price_train)
X_price_test_scaled = scaler.transform(X_price_test)


# In[ ]:




