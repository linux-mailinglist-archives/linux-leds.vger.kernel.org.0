Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3119A36F14D
	for <lists+linux-leds@lfdr.de>; Thu, 29 Apr 2021 22:50:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236882AbhD2Uu7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Apr 2021 16:50:59 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:12190 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229966AbhD2Uu7 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Apr 2021 16:50:59 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13TKX6H0109356;
        Thu, 29 Apr 2021 16:50:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=+lJW8sqJwEI0hybZTWZ3M//scidWBU0FxTTtQxAz4OU=;
 b=U8Cc+Mt2iQpf/jV5+VsC0La9aZpMB3f8VLdEtRF6XjATymTHvjctNoBPqdO52Zs1DyWK
 w8B4wChWGDZMsQ6HezxYeXYvK022vrzrk+of8+LhOoqrIgwzv2R4B4UhulzaB1H1Rdtd
 aasZvn7BL8d9fNKESzvh+tIQ9rVGPnGMFJbTANDaOVMmuR+OB9bDL/1JawXLUSuoESrT
 spErf1ZlniYuyKVPo6PQkMuXE43ELPVMNS/kXaWtNuvU+qtz6WMhycJQWFlaNSV3K5HN
 KiDQriS38qNpufe6nthorgGz1e6bu7LKSzV2XvUvd/smqxoz7Xw3TfuU7NPfJi1zth4P Sw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3883ech61j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 16:50:08 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13TKXR0n113357;
        Thu, 29 Apr 2021 16:50:08 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3883ech614-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 16:50:08 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TKfGuD020477;
        Thu, 29 Apr 2021 20:50:07 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
        by ppma04dal.us.ibm.com with ESMTP id 384aya8mwt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 20:50:07 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13TKo69B34537976
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 20:50:06 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C1B2C2806A;
        Thu, 29 Apr 2021 20:50:06 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D469F2805A;
        Thu, 29 Apr 2021 20:50:05 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.73.43])
        by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 29 Apr 2021 20:50:05 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, pavel@ucw.cz,
        jacek.anaszewski@gmail.com, robh+dt@kernel.or,
        devicetree@vger.kernel.org, vishwa@linux.ibm.com,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 0/5] leds: Support retaining state for the PCA955x
Date:   Thu, 29 Apr 2021 15:49:57 -0500
Message-Id: <20210429205002.70245-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Y81GTJAsVYS11NcwUa07wx8gz-D9_sV1
X-Proofpoint-ORIG-GUID: P6gmtKGH4EmS0flePYnG7Vr8zbG4_9po
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-29_11:2021-04-28,2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 phishscore=0 clxscore=1011 lowpriorityscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 mlxlogscore=939 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290133
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series implements the ability to retain the state of the LEDs
controlled by the PCA955x across system reboots. This includes a
change to the LED core driver to respect the retain-state-shutdown
device tree property. It also cleans up the PCA955x driver and adds
the ability to query the hardware LED brightness.

Eddie James (5):
  dt-bindings: leds: Add retain-state-shutdown boolean
  leds: leds-core: Implement the retain-state-shutdown property
  leds: pca955x: Clean up code formatting
  leds: pca955x: Add brightness_get function
  leds: pca955x: Implement the default-state property

 .../devicetree/bindings/leds/common.yaml      |   6 +
 drivers/leds/led-class.c                      |  10 +-
 drivers/leds/leds-pca955x.c                   | 169 +++++++++++++-----
 3 files changed, 142 insertions(+), 43 deletions(-)

-- 
2.27.0

