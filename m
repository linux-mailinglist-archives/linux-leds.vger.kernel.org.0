Return-Path: <linux-leds+bounces-27-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBDA7EF30F
	for <lists+linux-leds@lfdr.de>; Fri, 17 Nov 2023 13:54:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21CCB280F66
	for <lists+linux-leds@lfdr.de>; Fri, 17 Nov 2023 12:54:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E89F33034C;
	Fri, 17 Nov 2023 12:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mg7fSaYX"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF074FC08;
	Fri, 17 Nov 2023 12:54:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7672C433C7;
	Fri, 17 Nov 2023 12:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700225689;
	bh=jgQc5Itelpk92zM45YpqFlo1y4VJI+dnHxsnMdw3FZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mg7fSaYXjkW0T93Lpe/n79IhrWlBC15Gxd2bhh9VEEQTsdCNzpOFxXBHZ9Mid9MJW
	 uaZTpS/4fSrgMvOFG23qHmqv9SJ/UfOHoIu4EaC4U8esmvFCFcsH0fzhhjVPXehKcG
	 PpW5zmsMlu9aSPBUhrg+7bhG7dt2wEjy1zCa7Hlt8Rh2G4rPy+m1Oy8+qgoXKrEb8j
	 xr+0tpSZ4D7FYlBUygvGx0OKU8ccQKLVhTg7Cse9Yn7G9aaLpq8zhRBNHWMv9Xa1gk
	 hKtgr78XHjGXL2+BQDh2uKxmRtxlIwf7WttNVWLMy03Mu/e2nmSIrcbafGiDjz/clC
	 VWZTNDXKG4aSw==
Date: Fri, 17 Nov 2023 12:54:41 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>
Cc: Samuel Holland <samuel@sholland.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [RESEND PATCH v7 2/5] leds: sun50i-a100: New driver for the A100
 LED controller
Message-ID: <20231117125441.GC153049@google.com>
References: <20221231235541.13568-1-samuel@sholland.org>
 <20221231235541.13568-3-samuel@sholland.org>
 <c3ae7d79ab81621c66e939d804ca41e97eab79fb.camel@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c3ae7d79ab81621c66e939d804ca41e97eab79fb.camel@apitzsch.eu>

On Thu, 19 Oct 2023, André Apitzsch wrote:

> Hi Samuel,
> 
> there are two more things to change, which came up recently. See below.

Please remember to snip your replies.

> Regards,
> André

[snipped 600+ lines]

-- 
Lee Jones [李琼斯]

