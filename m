Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D9AA336F153
	for <lists+linux-leds@lfdr.de>; Thu, 29 Apr 2021 22:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236953AbhD2UvI (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Apr 2021 16:51:08 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:8732 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237137AbhD2UvE (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Apr 2021 16:51:04 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13TKYd94178960;
        Thu, 29 Apr 2021 16:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=kD6CWnjWnQCqHnvN5YeBi9I1D93PJO3VBd5NDp+glXk=;
 b=m9Q5knghMwBfmnNOOOtN5E3Mk8Ui70kgibxsFjunmRG5f+Ofh6Cwbte1kaXOwnt/H22H
 CdNc6lpunb65gA8NfpOIjpUt9fdnCNnWbWQb7ObCochWn0D2aGIOaebIURUCNwaD+hNb
 dACjsAv+fEv0Gg0yikJkesw3YgWsX9kY0OtGMD7Y16eCXZRnKnKtz6BBhaPdFFAEyK8M
 YiuiMCD9sHGRPb6XWd++3eeHZK1Xicq7DHPfcCBli03Y5JcEtoEIVN1DJRMx9FKA3zsE
 SQrG+B9WL/YAdB6Zn+AADnIzScMWhRUjkIcgSpXg3mykPpPylfY1lOTDEzHQB3X5TgvB /w== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3883gr90x5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 16:50:15 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13TKhimS046277;
        Thu, 29 Apr 2021 16:50:14 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3883gr90wk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 16:50:14 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TKfJ0b020662;
        Thu, 29 Apr 2021 20:50:13 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma04dal.us.ibm.com with ESMTP id 384aya8mxt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 20:50:13 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13TKoC0R33227082
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 20:50:12 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 944862806D;
        Thu, 29 Apr 2021 20:50:12 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A730928065;
        Thu, 29 Apr 2021 20:50:11 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.73.43])
        by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 29 Apr 2021 20:50:11 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, pavel@ucw.cz,
        jacek.anaszewski@gmail.com, robh+dt@kernel.or,
        devicetree@vger.kernel.org, vishwa@linux.ibm.com,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 2/5] leds: leds-core: Implement the retain-state-shutdown property
Date:   Thu, 29 Apr 2021 15:49:59 -0500
Message-Id: <20210429205002.70245-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429205002.70245-1-eajames@linux.ibm.com>
References: <20210429205002.70245-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _pv7SjKM_4vByQ6TWVOyOejtQDavHa9X
X-Proofpoint-GUID: _Ugymc6xAkhXPscAP00ko2BS-Xn69CuG
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-29_11:2021-04-28,2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=960 phishscore=0 spamscore=0 clxscore=1015 mlxscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104290133
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Read the retain-state-shutdown device tree property to set the
existing LED_RETAIN_AT_SHUTDOWN flag. Then check the flag when
unregistering, and if set, don't set the brightness to OFF. This
is useful for systems that want to keep the HW state of the LED
across reboots.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/leds/led-class.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-class.c b/drivers/leds/led-class.c
index 2e495ff67856..f2f29318d312 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -354,10 +354,15 @@ int led_classdev_register_ext(struct device *parent,
 		if (ret < 0)
 			return ret;
 
-		if (init_data->fwnode)
+		if (init_data->fwnode) {
 			fwnode_property_read_string(init_data->fwnode,
 				"linux,default-trigger",
 				&led_cdev->default_trigger);
+
+			if (fwnode_property_present(init_data->fwnode,
+						    "retain-state-shutdown"))
+				led_cdev->flags |= LED_RETAIN_AT_SHUTDOWN;
+		}
 	} else {
 		proposed_name = led_cdev->name;
 	}
@@ -448,7 +453,8 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	/* Stop blinking */
 	led_stop_software_blink(led_cdev);
 
-	led_set_brightness(led_cdev, LED_OFF);
+	if (!(led_cdev->flags & LED_RETAIN_AT_SHUTDOWN))
+		led_set_brightness(led_cdev, LED_OFF);
 
 	flush_work(&led_cdev->set_brightness_work);
 
-- 
2.27.0

