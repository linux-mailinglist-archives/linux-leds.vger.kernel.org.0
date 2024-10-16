Return-Path: <linux-leds+bounces-3117-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E23389A05C7
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 11:39:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 119DA1C25DC7
	for <lists+linux-leds@lfdr.de>; Wed, 16 Oct 2024 09:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABFE920607A;
	Wed, 16 Oct 2024 09:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b="ZDHjEYlh"
X-Original-To: linux-leds@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2070.outbound.protection.outlook.com [40.107.255.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A96206046;
	Wed, 16 Oct 2024 09:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729071548; cv=fail; b=tYtTcmvw9CZ2k+YFj4pHQa4R34HqWkPy2OKwOqOtWmhBLJ6fbmZIyOli1WuhwK0JDD1g16687Kie44yNJDoO3ZDRfWivJrxXskJC6tsD4rwRIggbZunbDC20b0YpxZ+lYPYxsqotPTMcmVFfBrkzIYaIDxtJsTJULdBp0RNiTO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729071548; c=relaxed/simple;
	bh=b1l1djCaoHGtIShioLiHSi9t8yhlm3J7LTW0X6ACLdo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=avm0ovZ5spj33MVJIkW/OTOTzUqlL9H9sfGw+txosqiJHYejN9Gg/XyxbqGXXt6W04fukjZrTeydNnId1NktjW/lR98QEMsIHDjKR42zTbLueD0DuWLK8VwkbFfwF9ifxu9x7Gl+RjLyWFk4xuIr23IYambE5NFdosCMZB1SN6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com; spf=pass smtp.mailfrom=wiwynn.com; dkim=pass (2048-bit key) header.d=wiwynn.com header.i=@wiwynn.com header.b=ZDHjEYlh; arc=fail smtp.client-ip=40.107.255.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wiwynn.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wiwynn.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XcYV+b2KwqGvXDvVBuRZUpybXo1y5IcaI0+hOpdsCWON9qib+AiaEB+0ce+lt7kigH+lAk503s+YX7rVVvDen6U57obyZl578DNkSG4W9SflvSJmYQuQDdkRZiCnFzH1gkfK5yc3tZa2UCA/fPxtTTUdK8WHBtwIErClVTGOTbGlU2Vwj9x8AuVs5b1zoWXUfhBXmwEAnXn5SfcraoJSdwQnIBbawKL7KnJbyqDNICvEnUVCoUf9eNbrWfodNIV3MBiTrR9fg7DdRlyXefZQKb6Q13nqj+CPL9DUIrKDgvK3THYHhsSyi+DNZwP9VZ1Ou0CsU01yWnqkWYgPFqeNqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3/J4iFQ/eRW6ZOQMaFobN3NlL0DmXsk2dcgywimxJU=;
 b=nipIOKavIl+n8AFZhGOeUVLfAO1SBSuOwj4WYDC69/032xWyVGotcwirWC1fiOscKxRtBFpqnx3Vby9LoT4pS3VJAaJRjGGeuGUeHwjMzzVgpk1VUGZz+BMGpZmBFHcX+OFUsdqHIQrauCbX0cC94Y6LlQvq7fZDCA6sjnr3XcB9RzYNd2UHvB4PBtGQZh7stJmvl0GSP2pfpNBn77juu0aBk39QF9dZ0SS789XEnS9J/yI8V6dWugQEbNbnAKCyBc14OsX2wsZIAa6dapT0qm5zPsKCYNTy6Y1HikXyr5Jdqr5zWKah3K/xZ8oMwTv/eIkS7JkA1G7OCjMN0F/yFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 211.20.1.79) smtp.rcpttodomain=stwcx.xyz smtp.mailfrom=wiwynn.com; dmarc=fail
 (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=wiwynn.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wiwynn.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3/J4iFQ/eRW6ZOQMaFobN3NlL0DmXsk2dcgywimxJU=;
 b=ZDHjEYlhtp0CumQfPXPSul3R2mi62KWjVmqcfFN9zOdFBu238qN75Hu11rNRD+HCXDKMVWs18BOLN10nlrTHRAx5AmXJb8MxT7cfH5btiP6YKbIlkcM7z9jm1MHmadXKx3eIDrKeKpLiv84ot/6sn1JYqdD03BnVpdpXZU/wxetAR8Ei+8KerfWEv9sMPxP6RDFTNLWORUVcM9y+u7rs3u2nktc4VXzS3pub91iO6zbyjjpgOU9b8Lrbt+v+6J8pInsWdwMm3SiDwA8KgLmWtI7TwVfaHEVhTymjZaX5HXc4RbQPHNp4fbrOe9N/52sedpObQBlhpmhTJfxGvfLUpA==
Received: from SG2P153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096::17) by
 KL1PR04MB8102.apcprd04.prod.outlook.com (2603:1096:820:145::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Wed, 16 Oct
 2024 09:39:01 +0000
Received: from SG1PEPF000082E3.apcprd02.prod.outlook.com
 (2603:1096::cafe:0:0:8) by SG2P153CA0007.outlook.office365.com
 (2603:1096::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.5 via Frontend
 Transport; Wed, 16 Oct 2024 09:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 211.20.1.79)
 smtp.mailfrom=wiwynn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=wiwynn.com;
Received-SPF: Fail (protection.outlook.com: domain of wiwynn.com does not
 designate 211.20.1.79 as permitted sender) receiver=protection.outlook.com;
 client-ip=211.20.1.79; helo=localhost.localdomain;
Received: from localhost.localdomain (211.20.1.79) by
 SG1PEPF000082E3.mail.protection.outlook.com (10.167.240.6) with Microsoft
 SMTP Server id 15.20.7918.13 via Frontend Transport; Wed, 16 Oct 2024
 09:38:59 +0000
From: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
To: patrick@stwcx.xyz,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nate Case <ncase@xes-inc.com>
Cc: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: leds: pca955x: Convert text bindings to YAML
Date: Wed, 16 Oct 2024 17:38:55 +0800
Message-Id: <20241016093857.925467-1-Delphine_CC_Chiu@wiwynn.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E3:EE_|KL1PR04MB8102:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 848eb5a1-1db1-40eb-4cef-08dcedc65d64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2w6u7mrVxsguv3uZgaMwtSoO3wlWn1VhG4yXfHIGfjroZYC9++sbxCJL0o9C?=
 =?us-ascii?Q?bqsUyLKVCCcHd9EZ0+mWhJCEZJJhbqaOK514ANZ0HW01xcGETDam5aAUc6qS?=
 =?us-ascii?Q?oyUZoIr6hu/mXniIaMtrODmJApaVMn0zu5YfLtepALigqJXBFOozYmnV+WGA?=
 =?us-ascii?Q?5Y1X0D7wHJOGMH8jHATiLXQCqkZ2MC2++a+d3KfGpWeUgYkwB1GGXbugAFkd?=
 =?us-ascii?Q?sGniuEc8dl8F7reyUexF5ThbW7M56toeFORGw+30yGkF4211A46bYLwFUvmy?=
 =?us-ascii?Q?yrp2RkVSkQjcXTidJ8j7RD4AbSzo1lE6Jtb+p4Vdpl/chrxLEbkRE4mSltlO?=
 =?us-ascii?Q?tFkMgJt15EWLkXebzJJCFnHDE7ZSn+2wlgyouWS9N3EYcJhBvUCCIlNgA/lM?=
 =?us-ascii?Q?bqVoiaC2ujQc6wOKVgYAhHyHn8M8xvkV2AvtwGdsvGrNGQxgJcOz5EvOI376?=
 =?us-ascii?Q?naq53F7xCV01Jp2ElxwXlXSKIcTVy9HMbjFS8zISEu+SWkDKl3chUS+tIS4k?=
 =?us-ascii?Q?oRbR7mhUNH9k63YvTT8fD/vuqvVoxoubjec9q8XDcqEMoSlEXzCN/vAqZAG/?=
 =?us-ascii?Q?8DL8/AhcC0RBEnslPUPMzUA6yQHRrqfviBI0IH0kDKFuQ+ELLz8KvFpSxhYu?=
 =?us-ascii?Q?zLzJuo8Z06ul1ydN9SNUq9FO3ynm7cDSRM8pkjAzTjxzySsOxPsEh4Tj9Nwv?=
 =?us-ascii?Q?s5XsQ7KSvltQgSCTv2Wu/1bl39fqQImnngSZDFQyO8SKLee9+7Q2qyEiOui2?=
 =?us-ascii?Q?wN0P1L+YkHpebgKeDHzlrAlmX4ERgMVCPDGnWEIIRYodfoU/fjEYerP3VsO6?=
 =?us-ascii?Q?HqHcoC6hAyk2dNeUIEl/5MWgVrCg5LVJbjO9NfhrGHfyFyJLVAzF5fJAFR8Z?=
 =?us-ascii?Q?mL/UoRl+EOXo5mH9FK8lEQ8A5CEXN5lD0tf4B3/nSAhEaTkHa/YPVe8walaB?=
 =?us-ascii?Q?jqaBoRWIG7idrZpLgsUAFPdrJizp0eF3GgUI1pa/0RNQxEJORACoZ4krihZm?=
 =?us-ascii?Q?mdUDItIzgtFv/HKblDYQi1WO2U+zHstkzHKJ+2ixa6+os++tLhLLEc63lwTy?=
 =?us-ascii?Q?5ztFQ9LFq5aE+pR6PSjLB/HiWldOVKIkMG1IfXqDv43Xci0/PKyeNjcVC6++?=
 =?us-ascii?Q?b9VNA+dXwOcahG36W4rnCunMpo1wmJpgUOuiLh11UrBDrE8+2vaj4rT4rr8t?=
 =?us-ascii?Q?Yp7RAlquZxC2XJBeplcM++jPj2LO+AV4YVl2QBN8men0foBIeBDOurt4oh3K?=
 =?us-ascii?Q?rfXdeSJzZai5PfZYnsFCCgeacyFRza2+fxKdyab0yU9UvMeM4th9cEXdIJcK?=
 =?us-ascii?Q?8gR9w41QlZSCBmM9Meh6KPo0?=
X-Forefront-Antispam-Report:
	CIP:211.20.1.79;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:localhost.localdomain;PTR:211-20-1-79.hinet-ip.hinet.net;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: wiwynn.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 09:38:59.8899
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 848eb5a1-1db1-40eb-4cef-08dcedc65d64
X-MS-Exchange-CrossTenant-Id: da6e0628-fc83-4caf-9dd2-73061cbab167
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=da6e0628-fc83-4caf-9dd2-73061cbab167;Ip=[211.20.1.79];Helo=[localhost.localdomain]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E3.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR04MB8102

From: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>

Convert the text bindings of pca955x to YAML so it could be used to
validate the DTS.

Signed-off-by: Ricky CX Wu <ricky.cx.wu.wiwynn@gmail.com>
Signed-off-by: Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>
---
 .../devicetree/bindings/leds/leds-pca955x.txt |  89 ----------
 .../devicetree/bindings/leds/nxp,pca955x.yaml | 158 ++++++++++++++++++
 2 files changed, 158 insertions(+), 89 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/leds/leds-pca955x.txt
 create mode 100644 Documentation/devicetree/bindings/leds/nxp,pca955x.yaml

diff --git a/Documentation/devicetree/bindings/leds/leds-pca955x.txt b/Documentation/devicetree/bindings/leds/leds-pca955x.txt
deleted file mode 100644
index 817f460f3a72..000000000000
--- a/Documentation/devicetree/bindings/leds/leds-pca955x.txt
+++ /dev/null
@@ -1,89 +0,0 @@
-* NXP - pca955x LED driver
-
-The PCA955x family of chips are I2C LED blinkers whose pins not used
-to control LEDs can be used as general purpose I/Os. The GPIO pins can
-be input or output, and output pins can also be pulse-width controlled.
-
-Required properties:
-- compatible : should be one of :
-	"nxp,pca9550"
-	"nxp,pca9551"
-	"nxp,pca9552"
-	"ibm,pca9552"
-	"nxp,pca9553"
-- #address-cells: must be 1
-- #size-cells: must be 0
-- reg: I2C slave address. depends on the model.
-
-Optional properties:
-- gpio-controller: allows pins to be used as GPIOs.
-- #gpio-cells: must be 2.
-- gpio-line-names: define the names of the GPIO lines
-
-LED sub-node properties:
-- reg : number of LED line.
-		from 0 to  1 for the pca9550
-		from 0 to  7 for the pca9551
-		from 0 to 15 for the pca9552
-		from 0 to  3 for the pca9553
-- type: (optional) either
-	PCA955X_TYPE_NONE
-	PCA955X_TYPE_LED
-	PCA955X_TYPE_GPIO
-	see dt-bindings/leds/leds-pca955x.h (default to LED)
-- label : (optional)
-	see Documentation/devicetree/bindings/leds/common.txt
-- linux,default-trigger : (optional)
-	see Documentation/devicetree/bindings/leds/common.txt
-
-Examples:
-
-pca9552: pca9552@60 {
-	compatible = "nxp,pca9552";
-	#address-cells = <1>;
-        #size-cells = <0>;
-	reg = <0x60>;
-
-	gpio-controller;
-	#gpio-cells = <2>;
-	gpio-line-names = "GPIO12", "GPIO13", "GPIO14", "GPIO15";
-
-	gpio@12 {
-		reg = <12>;
-		type = <PCA955X_TYPE_GPIO>;
-	};
-	gpio@13 {
-		reg = <13>;
-		type = <PCA955X_TYPE_GPIO>;
-	};
-	gpio@14 {
-		reg = <14>;
-		type = <PCA955X_TYPE_GPIO>;
-	};
-	gpio@15 {
-		reg = <15>;
-		type = <PCA955X_TYPE_GPIO>;
-	};
-
-	led@0 {
-		label = "red:power";
-		linux,default-trigger = "default-on";
-		reg = <0>;
-		type = <PCA955X_TYPE_LED>;
-	};
-	led@1 {
-		label = "green:power";
-		reg = <1>;
-		type = <PCA955X_TYPE_LED>;
-	};
-	led@2 {
-		label = "pca9552:yellow";
-		reg = <2>;
-		type = <PCA955X_TYPE_LED>;
-	};
-	led@3 {
-		label = "pca9552:white";
-		reg = <3>;
-		type = <PCA955X_TYPE_LED>;
-	};
-};
diff --git a/Documentation/devicetree/bindings/leds/nxp,pca955x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca955x.yaml
new file mode 100644
index 000000000000..ae7384cc760c
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/nxp,pca955x.yaml
@@ -0,0 +1,158 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/nxp,pca955x.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP PCA955X LED controllers
+
+maintainers:
+  - Nate Case <ncase@xes-inc.com>
+
+description: |
+  The PCA955x family of chips are I2C LED blinkers whose pins not used
+  to control LEDs can be used as general purpose I/Os. The GPIO pins can
+  be input or output, and output pins can also be pulse-width controlled.
+
+  For more product information please see the link below:
+  - https://www.nxp.com/docs/en/data-sheet/PCA9552.pdf
+
+properties:
+  compatible:
+    enum:
+      - nxp,pca9550
+      - nxp,pca9551
+      - nxp,pca9552
+      - ibm,pca9552
+      - nxp,pca9553
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  gpio-controller: true
+
+  gpio-line-names:
+    minItems: 1
+    maxItems: 16
+
+  "#gpio-cells":
+    const: 2
+
+patternProperties:
+  "^led@[0-9a-f]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+      type:
+        description: |
+          Output configuration, see include/dt-bindings/leds/leds-pca955x.h
+        $ref: /schemas/types.yaml#/definitions/uint32
+        default: 0
+        minimum: 0
+        maximum: 2
+
+    required:
+      - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9550
+    then:
+      patternProperties:
+        "^led@[0-9a-f]$":
+          properties:
+            reg:
+              maximum: 1
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9551
+    then:
+      patternProperties:
+        "^led@[0-9a-f]$":
+          properties:
+            reg:
+              maximum: 7
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9552
+              - ibm,pca9552
+    then:
+      patternProperties:
+        "^led@[0-9a-f]$":
+          properties:
+            reg:
+              maximum: 15
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - nxp,pca9553
+    then:
+      patternProperties:
+        "^led@[0-9a-f]$":
+          properties:
+            reg:
+              maximum: 3
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/leds-pca955x.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@60 {
+            compatible = "nxp,pca9552";
+            reg = <0x60>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0>;
+                label = "red:power";
+                linux,default-trigger = "default-on";
+                type = <PCA955X_TYPE_LED>;
+            };
+            led@1 {
+                reg = <1>;
+                label = "green:power";
+                type = <PCA955X_TYPE_LED>;
+            };
+            led@2 {
+                reg = <2>;
+                label = "pca9552:yellow";
+                type = <PCA955X_TYPE_LED>;
+            };
+            led@3 {
+                reg = <3>;
+                label = "pca9552:white";
+                type = <PCA955X_TYPE_LED>;
+            };
+        };
+    };
+
+...
-- 
2.25.1


