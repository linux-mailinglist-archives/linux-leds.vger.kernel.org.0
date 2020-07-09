Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECDFE21A8B8
	for <lists+linux-leds@lfdr.de>; Thu,  9 Jul 2020 22:12:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbgGIUMd (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 9 Jul 2020 16:12:33 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:14696 "EHLO
        mx0b-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726193AbgGIUMb (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 9 Jul 2020 16:12:31 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 069K368w002658;
        Thu, 9 Jul 2020 16:12:25 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32637tvg5m-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Jul 2020 16:12:25 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 069K3G0Z003074;
        Thu, 9 Jul 2020 16:12:25 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
        by mx0a-001b2d01.pphosted.com with ESMTP id 32637tvg5h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Jul 2020 16:12:25 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
        by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 069K4o0H032329;
        Thu, 9 Jul 2020 20:12:24 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
        by ppma04dal.us.ibm.com with ESMTP id 325k28b01y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 09 Jul 2020 20:12:24 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
        by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 069KCNWh45023678
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 9 Jul 2020 20:12:23 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 82101124055;
        Thu,  9 Jul 2020 20:12:23 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 76F52124052;
        Thu,  9 Jul 2020 20:12:22 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.54.227])
        by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
        Thu,  9 Jul 2020 20:12:22 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, dmurphy@ti.com, pavel@ucw.cz,
        jacek.anaszewski@gmail.com, eajames@linux.ibm.com,
        vishwa@linux.ibm.com
Subject: [PATCH 1/2] dt-bindings: leds: pca955x: Add IBM implementation compatible string
Date:   Thu,  9 Jul 2020 15:12:19 -0500
Message-Id: <20200709201220.13736-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200709201220.13736-1-eajames@linux.ibm.com>
References: <20200709201220.13736-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-09_10:2020-07-09,2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=1
 mlxlogscore=999 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007090135
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

IBM created an implementation of the PCA9552 on a PIC16F
microcontroller. Document the new compatible string for this device.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 Documentation/devicetree/bindings/leds/leds-pca955x.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-pca955x.txt b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
index 7a5830f8d5ab..28edb976ee77 100644
--- a/Documentation/devicetree/bindings/leds/leds-pca955x.txt
+++ b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
@@ -9,6 +9,7 @@ Required properties:
 	"nxp,pca9550"
 	"nxp,pca9551"
 	"nxp,pca9552"
+	"nxp,pca9552-ibm"
 	"nxp,pca9553"
 - #address-cells: must be 1
 - #size-cells: must be 0
-- 
2.24.0

