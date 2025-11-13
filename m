Return-Path: <linux-leds+bounces-6105-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A26C58F53
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 18:01:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4B7E734900E
	for <lists+linux-leds@lfdr.de>; Thu, 13 Nov 2025 16:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E96835970D;
	Thu, 13 Nov 2025 16:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e6P8PKTY"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22280339719;
	Thu, 13 Nov 2025 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763051755; cv=none; b=bXaaSCNpJgFgpaGcO7giv4s6PJnZiyYBZAtBKZskTTMc2HH4MtY4XcGYLREPDJD1Yk2v8F00bmjs1WZWiE8ld0hjtEqZMxwmXi9J2aZVCQLYkXJUPgyxCaFjhDRq4hh10Fsal95grqfavI53uB7GsbKYzZft0HVI0Vq6ExujXXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763051755; c=relaxed/simple;
	bh=cdRHosx/O0Ulg6B2qMkVUn6h8soMr/wMKtBDIxclsCQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LR9OIugNvNwQXaMe4TA+uqqf2UEb/13jgm3yrmQDGHgL9jF+kdKwcUbGxgaB1SUz+mHFi8mgnXbDSyjKceMdTCcHD1dwf8KOJeeTABA2n2h8zDVU1UUHkXnm4iIR7Ecdomk8xo0T4Wf2xU8KBlZHi8hv3bizBHLoyDvBI6IeclE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e6P8PKTY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2CE6C4CEF7;
	Thu, 13 Nov 2025 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763051754;
	bh=cdRHosx/O0Ulg6B2qMkVUn6h8soMr/wMKtBDIxclsCQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=e6P8PKTYBXBkE46MfBoh73NNTFoOnQsFrGHnUxNszYYBR8rmiH4+bGwrXEY7nVI1j
	 NCzxvV9Hk6ciT7d5ZTjRz2eTKVQLyIsBUPcc8Oxwjn24omMqJr5kOyEijTtcbvgEaN
	 aHER5YzX7Cp/g+HSYjHu/EEVVb70tLLq8t/PvR9eAaKhuD3rv1rncLZZUhGdh300RZ
	 xGWVjM3OHI6tq/fWLvRMIT6iGN2Nnn13aNoZH0XFE3/JAKAi+PH5HCS796Um74rdWL
	 S1IPHsshtGpyT/hAcDnA0EEytgdGds5w+q9rm9RMBuePjxW/krhfl4fLntIyUoxvDi
	 vg5fBmtevzlVg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>, 
 Junjie Cao <caojunjie650@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
In-Reply-To: <20251109032240.3422503-3-caojunjie650@gmail.com>
References: <20251109032240.3422503-3-caojunjie650@gmail.com>
Subject: Re: (subset) [PATCH v3 2/2] backlight: aw99706: Add support for
 Awinic AW99706 backlight
Message-Id: <176305175143.1576992.14048590828107741090.b4-ty@kernel.org>
Date: Thu, 13 Nov 2025 16:35:51 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Sun, 09 Nov 2025 11:22:40 +0800, Junjie Cao wrote:
> Add support for Awinic AW99706 backlight, which can be found in
> tablet and notebook backlight, one case is the Lenovo Legion Y700
> Gen4. This driver refers to the official datasheets and android
> driver, they can be found in [1].
> 
> [1] https://www.awinic.com/en/productDetail/AW99706QNR
> 
> [...]

Applied, thanks!

[2/2] backlight: aw99706: Add support for Awinic AW99706 backlight
      commit: 88a8e9b49ee80a9aafc1e0b8c6cf0884f63eefbb

--
Lee Jones [李琼斯]


