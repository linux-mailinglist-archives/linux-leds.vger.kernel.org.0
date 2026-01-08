Return-Path: <linux-leds+bounces-6577-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FE0D04515
	for <lists+linux-leds@lfdr.de>; Thu, 08 Jan 2026 17:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1924932C4DD0
	for <lists+linux-leds@lfdr.de>; Thu,  8 Jan 2026 15:14:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D772D37FF62;
	Thu,  8 Jan 2026 10:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b1duNlvX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FE43563CB;
	Thu,  8 Jan 2026 10:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767868897; cv=none; b=Iy59YpCKMEsynZLdYLFlEooJYNGKpVVXA1bjCtW3yoKOSlPY1paEllKh4HB5Bxw/yGw/JXtQhVldNTug3N2lGDh3WWs5dDxfwFhEm4lzI9SKeYnsBS9VqOdxg3YHhD0kRw3e0D8fWxh71Npyjo9bDK514X5Mx0OzdZAHMbcdNB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767868897; c=relaxed/simple;
	bh=oHZOtwXfaR8E+Mz2vSai5/IfoL7j9kFgMJa2TXcZtXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hoh0IPoX5tYGjtzlcxzeOUHm9d9tJcpj4eqKRPWFg/PPyaIxGRqi6ov69+pYBh0HnBHiX9uOlTt5zI1V7czRgFNyd/MEVf9intn546qUC1vNIghuR2RzkJEApvJDIWs7QajXV0wk+M0Qwk9KoiZecCj1Vf+03D1iBpeF85pUgkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b1duNlvX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8A02C116C6;
	Thu,  8 Jan 2026 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767868895;
	bh=oHZOtwXfaR8E+Mz2vSai5/IfoL7j9kFgMJa2TXcZtXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b1duNlvXcIeDbNE8BD9amAPgdJygBYKiUAYYZhGA0OCU71esvLzetO2FQNvZ4EfRX
	 SDnK8JEpW4W+W2NEA/bd4W9V6grYbj350LMXDuujf2gsvnzwrSMKogNWZw2t4wAqVv
	 SIzp7D7YW1wSHAkt0Fm+fiNxaKPvJcOQ7Ezjjg513HNhOBQ7TAC2UI3bL0EEV98FKv
	 T5tbG1XlcomqeXpe9AwzwVFfzqeOgduxgo4oZdHquMUNjVe3VEMnbJnKG9Yh/Iqguw
	 OrE8kXkgPkt/NNdu6F6QXs9c2ZqrqhJkVMduTo40g9XterNK78xEzSoUB8zu1ir0Yl
	 gJTO4aSti6ZTw==
Date: Thu, 8 Jan 2026 10:41:30 +0000
From: Lee Jones <lee@kernel.org>
To: Lukas Timmermann <linux@timmermann.space>
Cc: pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 0/2] Support for Osram as3668 LED driver
Message-ID: <20260108104130.GC302752@google.com>
References: <20251201230601.285641-1-linux@timmermann.space>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251201230601.285641-1-linux@timmermann.space>

On Tue, 02 Dec 2025, Lukas Timmermann wrote:

Running through checkpatch.pl
total: 0 errors, 0 warnings, 86 lines checked

"[PATCH v13 1/2] dt-bindings: leds: Add new as3668 support" has no obvious style problems and is ready for submission.
ERROR: Macros with complex values should be enclosed in parentheses
#115: FILE: drivers/leds/leds-as3668.c:35:
+#define AS3668_CURR_MODE_PACK(mode)	((mode) << 0) | \
+					((mode) << 2) | \
+					((mode) << 4) | \
+					((mode) << 6)

BUT SEE:

   do {} while (0) advice is over-stated in a few situations:

   The more obvious case is macros, like MODULE_PARM_DESC, invoked at
   file-scope, where C disallows code (it must be in functions).  See
   $exceptions if you have one to add by name.

   More troublesome is declarative macros used at top of new scope,
   like DECLARE_PER_CPU.  These might just compile with a do-while-0
   wrapper, but would be incorrect.  Most of these are handled by
   detecting struct,union,etc declaration primitives in $exceptions.

   Theres also macros called inside an if (block), which "return" an
   expression.  These cannot do-while, and need a ({}) wrapper.

   Enjoy this qualification while we work to improve our heuristics.

WARNING: please, no spaces at the start of a line
#135: FILE: drivers/leds/leds-as3668.c:55:
+    int ret;$

WARNING: please, no spaces at the start of a line
#136: FILE: drivers/leds/leds-as3668.c:56:
+    u8 channel_modes;$

WARNING: please, no spaces at the start of a line
#138: FILE: drivers/leds/leds-as3668.c:58:
+    ret = i2c_smbus_read_byte_data(led->chip->client, AS3668_CURR_MODE_REG);$

WARNING: please, no spaces at the start of a line
#139: FILE: drivers/leds/leds-as3668.c:59:
+    if (ret < 0) {$

ERROR: code indent should use tabs where possible
#140: FILE: drivers/leds/leds-as3668.c:60:
+        dev_err(led->cdev.dev, "failed to read channel modes\n");$

WARNING: please, no spaces at the start of a line
#140: FILE: drivers/leds/leds-as3668.c:60:
+        dev_err(led->cdev.dev, "failed to read channel modes\n");$

ERROR: code indent should use tabs where possible
#141: FILE: drivers/leds/leds-as3668.c:61:
+        return ret;$

WARNING: please, no spaces at the start of a line
#141: FILE: drivers/leds/leds-as3668.c:61:
+        return ret;$

WARNING: please, no spaces at the start of a line
#142: FILE: drivers/leds/leds-as3668.c:62:
+    }$

WARNING: please, no spaces at the start of a line
#143: FILE: drivers/leds/leds-as3668.c:63:
+    channel_modes = (u8)ret;$

WARNING: please, no spaces at the start of a line
#145: FILE: drivers/leds/leds-as3668.c:65:
+    channel_modes &= ~led->mode_mask;$

WARNING: please, no spaces at the start of a line
#146: FILE: drivers/leds/leds-as3668.c:66:
+    channel_modes |= led->mode_mask & (AS3668_CURR_MODE_PACK(mode));$

WARNING: please, no spaces at the start of a line
#148: FILE: drivers/leds/leds-as3668.c:68:
+    return i2c_smbus_write_byte_data(led->chip->client, AS3668_CURR_MODE_REG, channel_modes);$

WARNING: line length of 104 exceeds 100 columns
#247: FILE: drivers/leds/leds-as3668.c:167:
+		return dev_err_probe(&client->dev, -EIO, "failed to set zero initial current levels\n");

WARNING: DT compatible string "ams,as3668" appears un-documented -- check ./Documentation/devicetree/bindings/
#264: FILE: drivers/leds/leds-as3668.c:184:
+	{ .compatible = "ams,as3668" },

total: 3 errors, 13 warnings, 235 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
      mechanically convert to the typical style using --fix or --fix-inplace.

NOTE: Whitespace errors detected.
      You may wish to use scripts/cleanpatch or scripts/cleanfile

"[PATCH v13 2/2] leds: as3668: Driver for the ams Osram 4-channel" has style problems, please review.

NOTE: If any of the errors are false positives, please report
      them to the maintainer, see CHECKPATCH in MAINTAINERS.

-- 
Lee Jones [李琼斯]

