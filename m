Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF6BF3E8DEF
	for <lists+linux-leds@lfdr.de>; Wed, 11 Aug 2021 11:59:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236573AbhHKKAO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 11 Aug 2021 06:00:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236791AbhHKJ6c (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 11 Aug 2021 05:58:32 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9775EC06179B
        for <linux-leds@vger.kernel.org>; Wed, 11 Aug 2021 02:58:08 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by michel.telenet-ops.be with bizsmtp
        id g9y42500L1gJxCh069y4zZ; Wed, 11 Aug 2021 11:58:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDkzs-001zgG-1m; Wed, 11 Aug 2021 11:58:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mDkzr-005NOD-7t; Wed, 11 Aug 2021 11:58:03 +0200
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Robin van der Gracht <robin@protonic.nl>,
        Miguel Ojeda <ojeda@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Paul Burton <paulburton@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Pavel Machek <pavel@ucw.cz>, Marek Behun <marek.behun@nic.cz>,
        devicetree@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v5 01/19] uapi: Add <linux/map_to_14segment.h>
Date:   Wed, 11 Aug 2021 11:57:41 +0200
Message-Id: <20210811095759.1281480-2-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811095759.1281480-1-geert@linux-m68k.org>
References: <20210811095759.1281480-1-geert@linux-m68k.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a header file providing translation primitives and tables for the
conversion of (ASCII) characters to a 14-segments notation, as used by
14-segment alphanumeric displays.

This follows the spirit of include/uapi/linux/map_to_7segment.h.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v5:
  - No changes,

v4:
  - No changes,

v3:
  - No changes,

v2:
  - No changes.

You can find an image of the full character set at
https://drive.google.com/file/d/1h3EYFBWHIjh8B_cwPA5ocAD-lFYipRie/view

Note that all non-empty characters are unique, except for "[" and "C",
and "|" and ":".
---
 include/uapi/linux/map_to_14segment.h | 239 ++++++++++++++++++++++++++
 1 file changed, 239 insertions(+)
 create mode 100644 include/uapi/linux/map_to_14segment.h

diff --git a/include/uapi/linux/map_to_14segment.h b/include/uapi/linux/map_to_14segment.h
new file mode 100644
index 0000000000000000..957c3c43181043c5
--- /dev/null
+++ b/include/uapi/linux/map_to_14segment.h
@@ -0,0 +1,239 @@
+/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
+/*
+ * Copyright (C) 2021 Glider bv
+ *
+ * Based on include/uapi/linux/map_to_7segment.h:
+
+ * Copyright (c) 2005 Henk Vergonet <Henk.Vergonet@gmail.com>
+ */
+
+#ifndef MAP_TO_14SEGMENT_H
+#define MAP_TO_14SEGMENT_H
+
+/* This file provides translation primitives and tables for the conversion
+ * of (ASCII) characters to a 14-segments notation.
+ *
+ * The 14 segment's wikipedia notation below is used as standard.
+ * See: https://en.wikipedia.org/wiki/Fourteen-segment_display
+ *
+ * Notation:	+---a---+
+ *		|\  |  /|
+ *		f h i j b
+ *		|  \|/  |
+ *		+-g1+-g2+
+ *		|  /|\  |
+ *		e k l m c
+ *		|/  |  \|
+ *		+---d---+
+ *
+ * Usage:
+ *
+ *   Register a map variable, and fill it with a character set:
+ *	static SEG14_DEFAULT_MAP(map_seg14);
+ *
+ *
+ *   Then use for conversion:
+ *	seg14 = map_to_seg14(&map_seg14, some_char);
+ *	...
+ *
+ * In device drivers it is recommended, if required, to make the char map
+ * accessible via the sysfs interface using the following scheme:
+ *
+ * static ssize_t map_seg14_show(struct device *dev,
+ *				 struct device_attribute *attr, char *buf)
+ * {
+ *	memcpy(buf, &map_seg14, sizeof(map_seg14));
+ *	return sizeof(map_seg14);
+ * }
+ * static ssize_t map_seg14_store(struct device *dev,
+ *				  struct device_attribute *attr,
+ *				  const char *buf, size_t cnt)
+ * {
+ *	if (cnt != sizeof(map_seg14))
+ *		return -EINVAL;
+ *	memcpy(&map_seg14, buf, cnt);
+ *	return cnt;
+ * }
+ * static DEVICE_ATTR_RW(map_seg14);
+ */
+#include <linux/errno.h>
+#include <linux/types.h>
+
+#include <asm/byteorder.h>
+
+#define BIT_SEG14_A		0
+#define BIT_SEG14_B		1
+#define BIT_SEG14_C		2
+#define BIT_SEG14_D		3
+#define BIT_SEG14_E		4
+#define BIT_SEG14_F		5
+#define BIT_SEG14_G1		6
+#define BIT_SEG14_G2		7
+#define BIT_SEG14_H		8
+#define BIT_SEG14_I		9
+#define BIT_SEG14_J		10
+#define BIT_SEG14_K		11
+#define BIT_SEG14_L		12
+#define BIT_SEG14_M		13
+#define BIT_SEG14_RESERVED1	14
+#define BIT_SEG14_RESERVED2	15
+
+struct seg14_conversion_map {
+	__be16 table[128];
+};
+
+static __inline__ int map_to_seg14(struct seg14_conversion_map *map, int c)
+{
+	return c >= 0 && c < sizeof(map->table) ? __be16_to_cpu(map->table[c])
+						: -EINVAL;
+}
+
+#define SEG14_CONVERSION_MAP(_name, _map)	\
+	struct seg14_conversion_map _name = { .table = { _map } }
+
+/*
+ * It is recommended to use a facility that allows user space to redefine
+ * custom character sets for LCD devices. Please use a sysfs interface
+ * as described above.
+ */
+#define MAP_TO_SEG14_SYSFS_FILE	"map_seg14"
+
+/*******************************************************************************
+ * ASCII conversion table
+ ******************************************************************************/
+
+#define _SEG14(sym, a, b, c, d, e, f, g1, g2, h, j, k, l, m, n)	\
+	__cpu_to_be16( a << BIT_SEG14_A  |  b << BIT_SEG14_B  |	\
+		       c << BIT_SEG14_C  |  d << BIT_SEG14_D  |	\
+		       e << BIT_SEG14_E  |  f << BIT_SEG14_F  |	\
+		      g1 << BIT_SEG14_G1 | g2 << BIT_SEG14_G2 |	\
+		       h << BIT_SEG14_H  |  j << BIT_SEG14_I  |	\
+		       k << BIT_SEG14_J  |  l << BIT_SEG14_K  |	\
+		       m << BIT_SEG14_L  |  n << BIT_SEG14_M )
+
+#define _MAP_0_32_ASCII_SEG14_NON_PRINTABLE				\
+	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
+
+#define _MAP_33_47_ASCII_SEG14_SYMBOL				\
+	_SEG14('!', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('"', 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),	\
+	_SEG14('#', 0, 1, 1, 1, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0),	\
+	_SEG14('$', 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 0, 0, 1, 0),	\
+	_SEG14('%', 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0),	\
+	_SEG14('&', 1, 0, 0, 1, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1),	\
+	_SEG14('\'',0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),	\
+	_SEG14('(', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1),	\
+	_SEG14(')', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0),	\
+	_SEG14('*', 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1),	\
+	_SEG14('+', 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 0, 0, 1, 0),	\
+	_SEG14(',', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0),	\
+	_SEG14('-', 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('.', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1),	\
+	_SEG14('/', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0),
+
+#define _MAP_48_57_ASCII_SEG14_NUMERIC				\
+	_SEG14('0', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0),	\
+	_SEG14('1', 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0),	\
+	_SEG14('2', 1, 1, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('3', 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('4', 0, 1, 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('5', 1, 0, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1),	\
+	_SEG14('6', 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('7', 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0),	\
+	_SEG14('8', 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('9', 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0),
+
+#define _MAP_58_64_ASCII_SEG14_SYMBOL				\
+	_SEG14(':', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0),	\
+	_SEG14(';', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0),	\
+	_SEG14('<', 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1),	\
+	_SEG14('=', 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('>', 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0),	\
+	_SEG14('?', 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0),	\
+	_SEG14('@', 1, 1, 0, 1, 1, 1, 0, 1, 0, 1, 0, 0, 0, 0),
+
+#define _MAP_65_90_ASCII_SEG14_ALPHA_UPPER			\
+	_SEG14('A', 1, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('B', 1, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0),	\
+	_SEG14('C', 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('D', 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0),	\
+	_SEG14('E', 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('F', 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('G', 1, 0, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('H', 0, 1, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('I', 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0),	\
+	_SEG14('J', 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('K', 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1),	\
+	_SEG14('L', 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('M', 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 1, 0, 0, 0),	\
+	_SEG14('N', 0, 1, 1, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1),	\
+	_SEG14('O', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('P', 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('Q', 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1),	\
+	_SEG14('R', 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1),	\
+	_SEG14('S', 1, 0, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('T', 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0),	\
+	_SEG14('U', 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('V', 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0),	\
+	_SEG14('W', 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1),	\
+	_SEG14('X', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1),	\
+	_SEG14('Y', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0),	\
+	_SEG14('Z', 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0),
+
+#define _MAP_91_96_ASCII_SEG14_SYMBOL				\
+	_SEG14('[', 1, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('\\',0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),	\
+	_SEG14(']', 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('^', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1),	\
+	_SEG14('_', 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('`', 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
+
+#define _MAP_97_122_ASCII_SEG14_ALPHA_LOWER			\
+	_SEG14('a', 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0),	\
+	_SEG14('b', 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1),	\
+	_SEG14('c', 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('d', 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0),	\
+	_SEG14('e', 0, 0, 0, 1, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0),	\
+	_SEG14('f', 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 1, 0),	\
+	_SEG14('g', 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0),	\
+	_SEG14('h', 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0),	\
+	_SEG14('i', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0),	\
+	_SEG14('j', 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0),	\
+	_SEG14('k', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1),	\
+	_SEG14('l', 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('m', 0, 0, 1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 1, 0),	\
+	_SEG14('n', 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 1, 0),	\
+	_SEG14('o', 0, 0, 1, 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('p', 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0),	\
+	_SEG14('q', 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0),	\
+	_SEG14('r', 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('s', 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1),	\
+	_SEG14('t', 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('u', 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0),	\
+	_SEG14('v', 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0),	\
+	_SEG14('w', 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1),	\
+	_SEG14('x', 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1),	\
+	_SEG14('y', 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0),	\
+	_SEG14('z', 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0),
+
+#define _MAP_123_126_ASCII_SEG14_SYMBOL				\
+	_SEG14('{', 1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0),	\
+	_SEG14('|', 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1, 0),	\
+	_SEG14('}', 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1),	\
+	_SEG14('~', 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0),
+
+/* Maps */
+#define MAP_ASCII14SEG_ALPHANUM			\
+	_MAP_0_32_ASCII_SEG14_NON_PRINTABLE	\
+	_MAP_33_47_ASCII_SEG14_SYMBOL		\
+	_MAP_48_57_ASCII_SEG14_NUMERIC		\
+	_MAP_58_64_ASCII_SEG14_SYMBOL		\
+	_MAP_65_90_ASCII_SEG14_ALPHA_UPPER	\
+	_MAP_91_96_ASCII_SEG14_SYMBOL		\
+	_MAP_97_122_ASCII_SEG14_ALPHA_LOWER	\
+	_MAP_123_126_ASCII_SEG14_SYMBOL
+
+#define SEG14_DEFAULT_MAP(_name)		\
+	SEG14_CONVERSION_MAP(_name, MAP_ASCII14SEG_ALPHANUM)
+
+#endif	/* MAP_TO_14SEGMENT_H */
-- 
2.25.1

