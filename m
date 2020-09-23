Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2D942758DD
	for <lists+linux-leds@lfdr.de>; Wed, 23 Sep 2020 15:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726534AbgIWNge (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 23 Sep 2020 09:36:34 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:41566 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgIWNge (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 23 Sep 2020 09:36:34 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08NDZDqW181918;
        Wed, 23 Sep 2020 13:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=G7vwdydmEPKnlPfzhRZVnS9fyCf+/J1/JvH159StNS4=;
 b=e1bay5e/RnQyFy8e7iVuCRl9PIDAb08ZrmXrYmwVv2CYRonYl+aWXWPJQURFDgzDLbFc
 3MpuDf2QtGlnXqmGCcxz10NHrvseIDSiqKZ/GALGO+Ejng+kR+PjJrxAeDCtFzfErANw
 4D/E/dRiwEdvV8ROAeUQPq/RXhlbFOZXH5odZmVR5L0lpOT/2DYS0v7uCOm528LYYDaX
 bqPjZbMp89yKjPBsbG6lc75XTt9nC7kwTS4eznqvS8aHDJgsHFRh5IbDxU5/dyM90qXa
 OFGQOqo4LlwjMYNzetYCiFxQ68tef58keeRetysVv51rR3EAOgQxOWezJjqrdNEPPHIX OA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 33q5rggu8v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 23 Sep 2020 13:35:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08NDUUhZ119905;
        Wed, 23 Sep 2020 13:35:23 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 33nurup17x-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 23 Sep 2020 13:35:23 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08NDZLEN017235;
        Wed, 23 Sep 2020 13:35:21 GMT
Received: from kadam (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 23 Sep 2020 06:35:21 -0700
Date:   Wed, 23 Sep 2020 16:35:11 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     pavel@ucw.cz, dmurphy@ti.com, jacek.anaszewski@gmail.com,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] leds: lp50xx: Fix an error handling path in
 'lp50xx_probe_dt()'
Message-ID: <20200923133510.GJ4282@kadam>
References: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230107
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9752 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 impostorscore=0
 clxscore=1011 suspectscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009230108
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I've added Heikki Krogerus to the CC list because my question is mostly
about commit 59abd83672f7 ("drivers: base: Introducing software nodes to
the firmware node framework").

I have been trying to teach Smatch to understand reference counting so
it can discover these kinds of bugs automatically.

I don't know how software_node_get_next_child() can work when it doesn't
call kobject_get().  This sort of bug would have been caught in testing
because it affects the success path so I must be reading the code wrong.

drivers/leds/leds-lp50xx.c
   444  static int lp50xx_probe_dt(struct lp50xx *priv)
   445  {
   446          struct fwnode_handle *child = NULL;
   447          struct fwnode_handle *led_node = NULL;
   448          struct led_init_data init_data = {};
   449          struct led_classdev *led_cdev;
   450          struct mc_subled *mc_led_info;
   451          struct lp50xx_led *led;
   452          int ret = -EINVAL;
   453          int num_colors;
   454          u32 color_id;
   455          int i = 0;
   456  
   457          priv->enable_gpio = devm_gpiod_get_optional(priv->dev, "enable", GPIOD_OUT_LOW);
   458          if (IS_ERR(priv->enable_gpio)) {
   459                  ret = PTR_ERR(priv->enable_gpio);
   460                  dev_err(&priv->client->dev, "Failed to get enable gpio: %d\n",
   461                          ret);
   462                  return ret;
   463          }
   464  
   465          priv->regulator = devm_regulator_get(priv->dev, "vled");
   466          if (IS_ERR(priv->regulator))
   467                  priv->regulator = NULL;
   468  
   469          device_for_each_child_node(priv->dev, child) {
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^
This iterator is implemented by two possible function pointers.  Smatch
understands of_fwnode_get_next_child_node() and that it takes a
reference.  The software_node_get_next_child() function does not take
a kobject reference.

   470                  led = &priv->leds[i];
   471                  ret = fwnode_property_count_u32(child, "reg");
   472                  if (ret < 0) {
   473                          dev_err(&priv->client->dev, "reg property is invalid\n");
   474                          goto child_out;
   475                  }
   476  
   477                  ret = lp50xx_probe_leds(child, priv, led, ret);
   478                  if (ret)
   479                          goto child_out;
   480  
   481                  init_data.fwnode = child;
   482                  num_colors = 0;
   483  
   484                  /*
   485                   * There are only 3 LEDs per module otherwise they should be
   486                   * banked which also is presented as 3 LEDs.
   487                   */
   488                  mc_led_info = devm_kcalloc(priv->dev, LP50XX_LEDS_PER_MODULE,
   489                                             sizeof(*mc_led_info), GFP_KERNEL);
   490                  if (!mc_led_info)
   491                          return -ENOMEM;
   492  
   493                  fwnode_for_each_child_node(child, led_node) {
   494                          ret = fwnode_property_read_u32(led_node, "color",
   495                                                         &color_id);
   496                          if (ret) {
   497                                  dev_err(priv->dev, "Cannot read color\n");
   498                                  goto child_out;
   499                          }
   500  
   501                          mc_led_info[num_colors].color_index = color_id;
   502                          num_colors++;
   503                  }
   504  
   505                  led->priv = priv;
   506                  led->mc_cdev.num_colors = num_colors;
   507                  led->mc_cdev.subled_info = mc_led_info;
   508                  led_cdev = &led->mc_cdev.led_cdev;
   509                  led_cdev->brightness_set_blocking = lp50xx_brightness_set;
   510  
   511                  fwnode_property_read_string(child, "linux,default-trigger",
   512                                              &led_cdev->default_trigger);
   513  
   514                  ret = devm_led_classdev_multicolor_register_ext(&priv->client->dev,
   515                                                         &led->mc_cdev,
   516                                                         &init_data);
   517                  if (ret) {
   518                          dev_err(&priv->client->dev, "led register err: %d\n",
   519                                  ret);
   520                          goto child_out;
   521                  }
   522                  i++;
   523                  fwnode_handle_put(child);
                        ^^^^^^^^^^^^^^^^^^^^^^^^^
This will call software_node_put() which calls kobject_put().

   524          }
   525  
   526          return 0;
   527  
   528  child_out:
   529          fwnode_handle_put(child);
                ^^^^^^^^^^^^^^^^^^^^^^^^
Same here.

   530          return ret;
   531  }

regards,
dan carpenter

On Tue, Sep 22, 2020 at 11:05:15PM +0200, Christophe JAILLET wrote:
> In case of memory allocation failure, we must release some resources as
> done in all other error handling paths of the function.
> 
> 'goto child_out' instead of a direct return so that 'fwnode_handle_put()'
> is called when we break out of a 'device_for_each_child_node' loop.
> 
> Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/leds/leds-lp50xx.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/leds/leds-lp50xx.c b/drivers/leds/leds-lp50xx.c
> index 47144a37cb94..8178782f2a8a 100644
> --- a/drivers/leds/leds-lp50xx.c
> +++ b/drivers/leds/leds-lp50xx.c
> @@ -487,8 +487,10 @@ static int lp50xx_probe_dt(struct lp50xx *priv)
>  		 */
>  		mc_led_info = devm_kcalloc(priv->dev, LP50XX_LEDS_PER_MODULE,
>  					   sizeof(*mc_led_info), GFP_KERNEL);
> -		if (!mc_led_info)
> -			return -ENOMEM;
> +		if (!mc_led_info) {
> +			ret = -ENOMEM;
> +			goto child_out;
> +		}
>  
>  		fwnode_for_each_child_node(child, led_node) {
>  			ret = fwnode_property_read_u32(led_node, "color",
> -- 
> 2.25.1
