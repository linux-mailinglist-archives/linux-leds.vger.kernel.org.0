Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0D5C279B0C
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 18:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729747AbgIZQy0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 12:54:26 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:49069 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728504AbgIZQy0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 26 Sep 2020 12:54:26 -0400
Received: from buildfff.adridolf.com ([188.192.134.246]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MNccf-1k5un340pX-00P4zU; Sat, 26 Sep 2020 18:49:07 +0200
From:   Adrian Schmutzler <freifunk@adrianschmutzler.de>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org,
        Adrian Schmutzler <freifunk@adrianschmutzler.de>
Subject: [PATCH] MAINTAINERS: add include/dt-bindings/leds/ to linux-leds list
Date:   Sat, 26 Sep 2020 18:47:45 +0200
Message-Id: <20200926164745.3779-1-freifunk@adrianschmutzler.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:G1OHp5d+aHCc37t7T5akyefpAQ8xv2YYJ+3Scqx0PI+qxg83w0E
 qty3Qef/3ws5hut0Wd5X8xAUb4DKNRUNSJKe5dD3zz610yboFZqlWJlIdVStLcoxdSZbIQj
 a0NhCG1eiE3Ngr3Q0q8VS/9u/aC+pxYXgWsZV0KDkLBrKORUk8jiOL7dLTh9FMo8r7r9Hr0
 SREUjU+0k1aryt0Pg5z/g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bZxGYTepEFI=:qx7TkIGiPMboGmh7BKexjP
 8tYhDLDH7kXOFsJajL9irb8McwHJxZG04KQ1vaezZNYh+f/WfzRYwJKi5byJkJxiwnU3rl0VY
 EuKcir7vjnCVve+VOReddHq8Kvoc8gqPlamE9oR6Xk2nme7CpHnBLwQKcy+/bZxpPmzOQxULx
 0yrF61V/m4+U5BmwgrS0ZR/7cRqYBlyB3gPhUWJcg4HUvJhutxNjRE6M6ftHFAIn2b49UbhLI
 F2aJPlceCeOswDHWoQpB13EDBDPmJNDLuFRZhz3uY4a8You3mpeqo+gPDmp7zIj7fcCfl+vXQ
 0PP4PLxUJlhy8NK1j1cg/zynkIK8CH54fKimboEYQWOv66XNTUIBIKeJkLdmt6J26eCoXAyWp
 dBTDf/DxkyQ3e/eFwL3mb88HP6lXwxmMeGVLzUgfSFoh97Obt9y5ztqyyXFOT6vHOMFkDPdMF
 k8KzLdwzfRb02e8SXTGXCvMbBvnnf+1Kyle3I5BcUSQq+V/z6GH2jZyMv9oijtFl2zs5U916k
 pVoJyr+z5g5nlRmaHDFIeoF83GVoJUhKXFmhkS9pxdv1plpSh1h1Xk80drYI0O2TlPX3ubvUv
 f4pvOeX8F5B0YBRjb7jKKipYe0DbA2xNih90PePJs4uvYf815rZw/6KN0ND0rQur/jG/t5Jxu
 G3mB3mVhdmOy9DktsC/W3RHpXRyJvyatCsHdy+nWXYsxYaz+2TS/afazV92tdAvvooURXsfas
 HaoXwe++4YwVJJVOY5PxgwB8DIBaqnDSYHppTgAVtdu3nLxUZMQffX9lDTkSkQm7WnOnLZdxc
 H8geU+47UuhjVTyZEPJmaK3kE9eELxQ1vCdEX0fX7czQjaBfcMz9+34cHGgvd7ygi5pzQWlkG
 fEm2SI3NtIzaqjyxRPyw==
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The content of include/dt-bindings/leds/, particularly common.h,
is apparantly maintained by the linux-leds list. This is also
explicitly stated in the Documentation.

Signed-off-by: Adrian Schmutzler <freifunk@adrianschmutzler.de>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 190c7fa2ea01..415f0e089bbe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9809,6 +9809,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
 F:	Documentation/devicetree/bindings/leds/
 F:	drivers/leds/
+F:	include/dt-bindings/leds/
 F:	include/linux/leds.h
 
 LEGACY EEPROM DRIVER
-- 
2.20.1

