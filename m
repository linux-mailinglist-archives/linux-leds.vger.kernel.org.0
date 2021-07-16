Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32E933CBEDF
	for <lists+linux-leds@lfdr.de>; Sat, 17 Jul 2021 00:03:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236100AbhGPWGh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jul 2021 18:06:37 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15084 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229951AbhGPWGg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Jul 2021 18:06:36 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GLYRam179658;
        Fri, 16 Jul 2021 18:03:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=F43RN/7tpoWjldr4PC1nPhWbu+H9VTZNHZFKZko+AaE=;
 b=YYQrnglnp9tNgfXipWg04TSxKPi/dQzzgJq0pqu6MHJK2nwWrolD1VVHfOr9+PWDtzU5
 kHlE3bgFvA4JdmlOPUpx/CBLP3aPIHoOh8p4c2bxlRLVJJHCylDvX4zsTtqugFZVpxGZ
 TulEYmZhhhlNlUsUxqs55kquqaB/OCWy7WSWgm5VAH0y/326qC69Gdb7o7KZi/wp+wxp
 jO4D1rQ/sAFTE7ICPv3EnW9VvopWgH4AgLyGWxX9hLYz8wYV9/SUfjqRf1lgaQ4/0nCv
 UfFJ3rkRJ16y5t+8SX1v9+8Iy3y1GBlolk0YwumURLvRefOeAplmanpAx49yXGk+/lGN ag== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0b-001b2d01.pphosted.com with ESMTP id 39tw2sac6k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 18:03:37 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GLwg9R030701;
        Fri, 16 Jul 2021 22:03:37 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma02dal.us.ibm.com with ESMTP id 39qt3f8qqp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 22:03:37 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16GM3ZCI48234758
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Jul 2021 22:03:35 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C2EFDC605B;
        Fri, 16 Jul 2021 22:03:35 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 815E6C6061;
        Fri, 16 Jul 2021 22:03:35 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.92.96])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Fri, 16 Jul 2021 22:03:35 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, pavel@ucw.cz,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH v2 2/7] leds: leds-core: Implement the retain-state-shutdown property
Date:   Fri, 16 Jul 2021 17:03:26 -0500
Message-Id: <20210716220331.49303-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716220331.49303-1-eajames@linux.ibm.com>
References: <20210716220331.49303-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 34dSnl0KOth7ELwEPk7_sJbPDPoY40v5
X-Proofpoint-ORIG-GUID: 34dSnl0KOth7ELwEPk7_sJbPDPoY40v5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_10:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxscore=0 mlxlogscore=942 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107160136
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
index f704391d57a8..f4bb02f6e042 100644
--- a/drivers/leds/led-class.c
+++ b/drivers/leds/led-class.c
@@ -350,10 +350,15 @@ int led_classdev_register_ext(struct device *parent,
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
@@ -444,7 +449,8 @@ void led_classdev_unregister(struct led_classdev *led_cdev)
 	/* Stop blinking */
 	led_stop_software_blink(led_cdev);
 
-	led_set_brightness(led_cdev, LED_OFF);
+	if (!(led_cdev->flags & LED_RETAIN_AT_SHUTDOWN))
+		led_set_brightness(led_cdev, LED_OFF);
 
 	flush_work(&led_cdev->set_brightness_work);
 
-- 
2.27.0

