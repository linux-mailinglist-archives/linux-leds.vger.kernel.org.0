Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49C9D23A8E8
	for <lists+linux-leds@lfdr.de>; Mon,  3 Aug 2020 16:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgHCOvK (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 3 Aug 2020 10:51:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:40782 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728309AbgHCOvK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 3 Aug 2020 10:51:10 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 073EYKBb139790;
        Mon, 3 Aug 2020 10:50:59 -0400
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0b-001b2d01.pphosted.com with ESMTP id 32pkrghyyk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Aug 2020 10:50:59 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 073EYwTB143770;
        Mon, 3 Aug 2020 10:50:59 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
        by mx0b-001b2d01.pphosted.com with ESMTP id 32pkrghyy6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Aug 2020 10:50:59 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
        by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 073Eo0ID016173;
        Mon, 3 Aug 2020 14:50:58 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
        by ppma04wdc.us.ibm.com with ESMTP id 32n018rrnd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 03 Aug 2020 14:50:58 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
        by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 073EosVh30277916
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 3 Aug 2020 14:50:54 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 3D99F136051;
        Mon,  3 Aug 2020 14:50:57 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AE4A4136055;
        Mon,  3 Aug 2020 14:50:56 +0000 (GMT)
Received: from ghost4.ibm.com (unknown [9.163.93.250])
        by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
        Mon,  3 Aug 2020 14:50:56 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-leds@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, dmurphy@ti.com, pavel@ucw.cz,
        jacek.anaszewski@gmail.com, vishwa@linux.ibm.com,
        andy.shevchenko@gmail.com, eajames@linux.ibm.com
Subject: [PATCH v2 1/2] dt-bindings: leds: pca955x: Add IBM implementation compatible string
Date:   Mon,  3 Aug 2020 09:50:54 -0500
Message-Id: <20200803145055.5203-2-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200803145055.5203-1-eajames@linux.ibm.com>
References: <20200803145055.5203-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-03_13:2020-08-03,2020-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 suspectscore=1 adultscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008030106
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
index 7a5830f8d5ab..817f460f3a72 100644
--- a/Documentation/devicetree/bindings/leds/leds-pca955x.txt
+++ b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
@@ -9,6 +9,7 @@ Required properties:
 	"nxp,pca9550"
 	"nxp,pca9551"
 	"nxp,pca9552"
+	"ibm,pca9552"
 	"nxp,pca9553"
 - #address-cells: must be 1
 - #size-cells: must be 0
-- 
2.24.0

