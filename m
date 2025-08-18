Return-Path: <linux-leds+bounces-5233-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78EBAB296B8
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 04:07:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 037D3200448
	for <lists+linux-leds@lfdr.de>; Mon, 18 Aug 2025 02:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6634B227B8C;
	Mon, 18 Aug 2025 02:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Pac7SOlr"
X-Original-To: linux-leds@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFD720ED;
	Mon, 18 Aug 2025 02:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755482848; cv=none; b=N1Zau3eObZzEGRtzKfn6pDgGTfybOhohyKVrkN2u3WmpLfnVKehZZxA89PkKRzcT5ZXUd0ZctZsCbDC8Kpe3pw/QcAOKv45U8hhTn2ile7y5Ux2vzjGLDPiyoNmNotz1WzLhIIKxYfKrYvuCJxbbOEy5qklSeiFAI26dwmF1P4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755482848; c=relaxed/simple;
	bh=tbK2yh3A3OA8ArQ2ixl3TH5f2ZmJfi3EpsQVKWcU3kE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oRbb1tRy6oyjRhQ//cKeILEnIPEX/H/uh/kjAXtS8CScT6syJO4y0LKv3HuBIFNKKtSx/qJWBsT4F9XoFgvmNOTFqLjSAUc7/tVuMPXETlNHFtS0/viACNG0GUJSTEw9SJF0G7BCmXYzoNwXRzN6C3grUpL8ihNG1volWW9UjEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Pac7SOlr; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=2yAFngKlaIbQ81FU5PwiV6FqFqMHMTpSSXBS/3aKEEg=; b=Pac7SOlrI2fWJyImdOoCJ+H+X3
	87M4L0WiOPPqpNiD57ritTvlD8zN2zXjCpEUAsSj8Xd6N2MG5kfhGtodbSeEfLKwQNUj5agHqosdy
	riZCVn5tWUA6UpJUj+eDTb83clI50Y0muGDedJsX1K2h9N5Tbg6f6a8lFSLTfqpSLXiOylBbZABKt
	pd6jYwif/tpL+seDfWYauZpxbXBrALEdAuOxVQLDg3vN6A80fQGHJAIczJJWq6zu1iiu7PvmkBJYh
	ZZA8Gl9xz6WKBYz6ePBg2p56FDde0BcHpzEwzt+0JkrpPdkyuSBcSzPJj8r1KDVxOrBQOs2BPHYp2
	pKqPCuAA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unpHN-00000006J4q-2m3U;
	Mon, 18 Aug 2025 02:07:21 +0000
Message-ID: <1075a908-23d0-4a9e-97d2-cb68d1d6b675@infradead.org>
Date: Sun, 17 Aug 2025 19:07:21 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 RESEND 3/4] docs: ABI: Document LP5812 LED sysfs
 interfaces
To: Nam Tran <trannamatk@gmail.com>, lee@kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: pavel@kernel.org, christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org,
 robh@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250818012654.143058-1-trannamatk@gmail.com>
 <20250818012654.143058-4-trannamatk@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250818012654.143058-4-trannamatk@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi--

On 8/17/25 6:26 PM, Nam Tran wrote:
> The LP5812 is a 4x3 matrix RGB LED driver with autonomous animation
> engine control.
> 
> This patch documents the basic sysfs interfaces provided by the driver,
> including LED activation, current control, fault status, and simple
> chip-level operations such as software reset and fault clearing.
> 
> Signed-off-by: Nam Tran <trannamatk@gmail.com>
> ---
>  .../ABI/testing/sysfs-bus-i2c-devices-lp5812  | 32 +++++++++++++++++++
>  .../ABI/testing/sysfs-class-led-lp5812        | 32 +++++++++++++++++++
>  MAINTAINERS                                   |  2 ++
>  3 files changed, 66 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-bus-i2c-devices-lp5812
>  create mode 100644 Documentation/ABI/testing/sysfs-class-led-lp5812
> 


> diff --git a/Documentation/ABI/testing/sysfs-class-led-lp5812 b/Documentation/ABI/testing/sysfs-class-led-lp5812
> new file mode 100644
> index 000000000000..93eeecc60864
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-led-lp5812
> @@ -0,0 +1,32 @@
> +What:		/sys/class/leds/led_<id>/activate
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Activate or deactivate the specified LED channel. (WO)
> +		1 - Activate
> +		0 - Deactivate
> +
> +What:		/sys/class/leds/led_<id>/led_current
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		DC current level. (WO)
> +		Valid values: 0 - 255
> +
> +What:		/sys/class/leds/led_<id>/max_current
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		Shows maximum DC current bit setting. (RO)
> +		0 (default) means the LED maximum current is set to 25.5 mA.
> +		1 means the LED maximum current is set to 51 mA.
> +
> +What:		/sys/class/leds/led_<id>/lod_lsd
> +Date:		July 2025
> +KernelVersion:	6.17
> +Contact:	Nam Tran <trannamatk@gmail.com>
> +Description:
> +		0 0 mean no lod and lsd fault detected, 1 1 mean lod and lsd fault detected (RO)

At first the "0 0" and "1 1" confused me (thought it was a typo),
but I think what you are showing here is a sysfs file with 2 values, right?
That used to be discouraged (or even nacked), although I don't know the
current policy on that.

@Greg, any comment?


-- 
~Randy


