Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 515E1A9EFF
	for <lists+linux-leds@lfdr.de>; Thu,  5 Sep 2019 11:57:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731952AbfIEJ55 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 5 Sep 2019 05:57:57 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:36092 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731588AbfIEJ55 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 Sep 2019 05:57:57 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x859sTxE183219;
        Thu, 5 Sep 2019 09:57:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=9lPEGcBzjzAk62gArlSPKrtdXhKRkStnOq1W1NMjXGI=;
 b=ml6/YSXq8mNXPd/QW9YP8YnIHmA3uhzSE4eX3njS5uB7d3CKJNyr9IYyhDtBGw30nY9n
 xgHOT68xfPamF2GhhQ+lYoMpWUv22dR91/8bIqPkZP9gxVNEzr0eb34SoxsWkpeqwEXD
 ad7BIYAnGI68B50QWy0rSPG8PUPdcHVndbEgxoeF6WeN84iA+KBPdmyxWQNqbpa62WVV
 bPJnI2a68QsSiMtgN5kJ/YfgxdOwtWlTxWW9/9E4Ao2QldnZyPgtlQaccDQClmy9qs7o
 vijkN3rKXclLBdNyCXBSXf09D3+UJWoo6pJE9dSnFshyFCe0VMxJAyzFeHZeV+AFIgr2 jw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2utyt8r3rt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Sep 2019 09:57:44 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x859rY1o029882;
        Thu, 5 Sep 2019 09:57:44 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3030.oracle.com with ESMTP id 2usu52wb2j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 05 Sep 2019 09:57:44 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x859vfFO009142;
        Thu, 5 Sep 2019 09:57:41 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 05 Sep 2019 02:57:40 -0700
Date:   Thu, 5 Sep 2019 12:57:28 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] led: triggers: Fix NULL dereference in led_trigger_set()
 error handling
Message-ID: <20190905095728.GA26005@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1906280000 definitions=main-1909050100
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9370 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1906280000
 definitions=main-1909050100
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The problem is we set "led_cdev->trigger = NULL;" and then dereference
it when we call write_lock_irqsave():

	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
                            ^^^^^^^^^^^^^^^^^

Fixes: 2282e125a406 ("leds: triggers: let struct led_trigger::activate() return an error code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/leds/led-triggers.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index eff1bda8b520..13cea227277c 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -167,12 +167,12 @@ int led_trigger_set(struct led_classdev *led_cdev, struct led_trigger *trig)
 		trig->deactivate(led_cdev);
 err_activate:
 
-	led_cdev->trigger = NULL;
-	led_cdev->trigger_data = NULL;
 	write_lock_irqsave(&led_cdev->trigger->leddev_list_lock, flags);
 	list_del(&led_cdev->trig_list);
 	write_unlock_irqrestore(&led_cdev->trigger->leddev_list_lock, flags);
+	led_cdev->trigger = NULL;
+	led_cdev->trigger_data = NULL;
 	led_set_brightness(led_cdev, LED_OFF);
 	kfree(event);
 
 	return ret;
-- 
2.20.1

