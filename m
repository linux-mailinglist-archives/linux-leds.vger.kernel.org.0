Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E89D3CBEE5
	for <lists+linux-leds@lfdr.de>; Sat, 17 Jul 2021 00:03:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhGPWGi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 16 Jul 2021 18:06:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9070 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233454AbhGPWGg (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Fri, 16 Jul 2021 18:06:36 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16GM31qr078136;
        Fri, 16 Jul 2021 18:03:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0vxj056b3igrjtxLy1NS6cIUfGWz7kZfJxd4DpI4RCE=;
 b=sWjan+X5pM7a/SkiZPMnpVzzxTr7OT4TzZ/DK2OUJeVKTFOVY3xePrUbruvDNmEMWuHQ
 xhz3qm1m8JTfYzp43TF+qwuyS8EYqcJyi9tjagzRR9Jq4+eOmbpwtsfO7fNdVkVCbx1D
 g39ZytVZAaUonQhhX65B98x3jgy1/C+bLuZQtJTJx1cHf42/wMHRkSxEVyewF28yy2jF
 vxMvUjjFSfAnJMVTyDV1utVCguwDGtMocvSzxwK9vyo93TH/nMUdh849BOZsTsH90w/h
 L6j8YNi9nkv6XBSGXG5Q8mximUC8uZLHVyOEzAanB1Z8r34R0ycJCdhyFN91D1s2llsr Hw== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0a-001b2d01.pphosted.com with ESMTP id 39ugk3awar-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 18:03:37 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16GLwjbU017422;
        Fri, 16 Jul 2021 22:03:36 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
        by ppma04dal.us.ibm.com with ESMTP id 39q36fvj21-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Jul 2021 22:03:36 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 16GM3ZXv45482426
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 16 Jul 2021 22:03:35 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 725D9C6063;
        Fri, 16 Jul 2021 22:03:35 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 159AAC6062;
        Fri, 16 Jul 2021 22:03:35 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.211.92.96])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Fri, 16 Jul 2021 22:03:35 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, pavel@ucw.cz,
        Eddie James <eajames@linux.ibm.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 1/7] dt-bindings: leds: Add retain-state-shutdown boolean
Date:   Fri, 16 Jul 2021 17:03:25 -0500
Message-Id: <20210716220331.49303-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210716220331.49303-1-eajames@linux.ibm.com>
References: <20210716220331.49303-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wu6loeW0tgnbbJoMyCXvcJH6A92wrIBs
X-Proofpoint-GUID: wu6loeW0tgnbbJoMyCXvcJH6A92wrIBs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-16_10:2021-07-16,2021-07-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107160140
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Document the retain-state-shutdown property that indicates that a LED
should not be turned off or changed during system shutdown.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
Acked-by: Rob Herring <robh@kernel.org>
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

