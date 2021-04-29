Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5118B36F150
	for <lists+linux-leds@lfdr.de>; Thu, 29 Apr 2021 22:50:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236986AbhD2UvD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 29 Apr 2021 16:51:03 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:30734 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236953AbhD2UvC (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 29 Apr 2021 16:51:02 -0400
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13TKYHtG134587;
        Thu, 29 Apr 2021 16:50:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3/Gv7+bvGd3iFR7SC+T8vf9gNejjo/KLP6NdmXdfPLw=;
 b=CXgJxdrEem8fa2asSBcPnAmifYmpMAO8BFF8SLeSMFbrlwUYi2QujmOgyOHgzZTKDzbz
 spPMLc1VgkJVK4+yjDrkH80aGrVCrd5gssTuNK4iBfxkuk4Mlj4vfpoZStuANpGFTw+p
 9bC3jlpwWflN3N2lAetzQCvr9lO3RGAIJ/q9F5msRJ7vkC9KIYMOOa+00AsxM4cgocbH
 jKVDNZksg5J6YWKoO5oSL/g557KthGsDxOwYbTwGohW+5r0x/wlTck/QDSFHgQvHH1Pq
 I/PgXo/UwTqcVPGP67XgppPFaP4gFYEDFx7cgmL63CmmZmCey+5+PLU3mcqiF5vsPi3y BA== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3883udremy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 16:50:12 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13TKerSF014747;
        Thu, 29 Apr 2021 16:50:11 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3883udremg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 16:50:11 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TKfJQS020669;
        Thu, 29 Apr 2021 20:50:10 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
        by ppma04dal.us.ibm.com with ESMTP id 384aya8mx9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 29 Apr 2021 20:50:10 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
        by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 13TKoAOG27001242
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 29 Apr 2021 20:50:10 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 015552806E;
        Thu, 29 Apr 2021 20:50:10 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 13A8F2805A;
        Thu, 29 Apr 2021 20:50:09 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.73.43])
        by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu, 29 Apr 2021 20:50:08 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, pavel@ucw.cz,
        jacek.anaszewski@gmail.com, robh+dt@kernel.or,
        devicetree@vger.kernel.org, vishwa@linux.ibm.com,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 1/5] dt-bindings: leds: Add retain-state-shutdown boolean
Date:   Thu, 29 Apr 2021 15:49:58 -0500
Message-Id: <20210429205002.70245-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210429205002.70245-1-eajames@linux.ibm.com>
References: <20210429205002.70245-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8emXJK8JT8-zAUvKV0OR1iCJfQosuAin
X-Proofpoint-GUID: 3KzRcFAZs_cjkItwd1OKB_yx2Co2QzU7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-29_11:2021-04-28,2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290133
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Document the retain-state-shutdown property that indicates that a LED
should not be turned off or changed during system shutdown.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/leds/common.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Documentation/devicetree/bindings/leds/common.yaml
index b1f363747a62..697102707703 100644
--- a/Documentation/devicetree/bindings/leds/common.yaml
+++ b/Documentation/devicetree/bindings/leds/common.yaml
@@ -128,6 +128,12 @@ properties:
       as a panic indicator.
     type: boolean
 
+  retain-state-shutdown:
+    description:
+      This property specifies that the LED should not be turned off or changed
+      when the system shuts down.
+    type: boolean
+
   trigger-sources:
     description: |
       List of devices which should be used as a source triggering this LED
-- 
2.27.0

