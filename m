Return-Path: <linux-leds+bounces-371-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DA78118F6
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 17:16:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA396B21090
	for <lists+linux-leds@lfdr.de>; Wed, 13 Dec 2023 16:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 531E33309A;
	Wed, 13 Dec 2023 16:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEnh6kWZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C54321B1;
	Wed, 13 Dec 2023 16:16:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BCE7C433C9;
	Wed, 13 Dec 2023 16:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702484187;
	bh=nO/Afdb1MQKBEbsD0Fg8t6VLdNzw0l4HZRWVO9Xe1jk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YEnh6kWZVMSxojQd7SFu7l2lTpqmRjiQF4Vge6kQ1wOxYB1ku/1bP3LytqpqAFLbz
	 h743XU7UCLaUZ5W2RdDjD/ipVd7Z48mrFjqRXiuFqwBnQDgCss5JVtHUmDSQ4swxsE
	 2ms+RHTAK1VwmRKb2oCnQLTSck1WALJLXwpQsHjzJPB7Zilv+EwJKwz4D2aGzk1wE9
	 7SVKz2DM9ZcjsqpqN29xr3EVXb9nFlK/tzRwDa6glGzhJI0gfNsu8HCow4Omo0a1f8
	 ajKBfOtMzhqwUr+O3Gqu43gmM3CU74zDpNdUY2OPvl2W9dPkiMSer5JZuBTwMfeS13
	 XmAv5+SHJsP8Q==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Nathan Chancellor <nathan@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev
In-Reply-To: <20231212214536.175327-1-arnd@kernel.org>
References: <20231212214536.175327-1-arnd@kernel.org>
Subject: Re: (subset) [PATCH] leds: sun50i-a100: avoid division-by-zero
 warning
Message-Id: <170248418423.1005780.5339514949375553684.b4-ty@kernel.org>
Date: Wed, 13 Dec 2023 16:16:24 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Tue, 12 Dec 2023 22:45:22 +0100, Arnd Bergmann wrote:
> When CONFIG_COMMON_CLK is disabled, e.g. on an x86 randconfig compile test,
> clang reports a field overflow from propagating the result of a division by
> zero:
> 
> drivers/leds/leds-sun50i-a100.c:309:12: error: call to '__compiletime_assert_265' declared with 'error' attribute: FIELD_PREP: value too large for the field
>         control = FIELD_PREP(LEDC_T01_TIMING_CTRL_REG_T1H, timing->t1h_ns / cycle_ns) |
> 
> [...]

Applied, thanks!

[1/1] leds: sun50i-a100: avoid division-by-zero warning
      commit: f969d75a0218da32c40dd4940bd430b0530433cf

--
Lee Jones [李琼斯]


