Return-Path: <linux-leds+bounces-3174-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9202A9B1A06
	for <lists+linux-leds@lfdr.de>; Sat, 26 Oct 2024 19:17:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5791F284654
	for <lists+linux-leds@lfdr.de>; Sat, 26 Oct 2024 17:17:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3D9481C4;
	Sat, 26 Oct 2024 17:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Kjl0Krxz"
X-Original-To: linux-leds@vger.kernel.org
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D7F3BBD8;
	Sat, 26 Oct 2024 17:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729963070; cv=none; b=rmgK5R/I++3ePb6yAe+n5EHV2DdBolTdWNWwYs4nNXI0SnqWeG9u3I/rj48x7iisHsvEJcFvbi5VieYbtmWngz8Vx714EnZ2jUJdMlcVXK9Qys3D9d707IPBHjqKrP169o5/yHyMbIijgrC+9hNvhGBgciGcbXU6ED8mgDZTgqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729963070; c=relaxed/simple;
	bh=UmBE9vHOfIOTS7rcqqGq9NZVUSg9LyFR7vFT1/hVmR0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=UMbekdLhBRLPfaZR9Ru3Y0YybRSDOWa+zGIJoXZ8nN87a9v6vzhF7xg9A2KhW4rpIL7FmU5jH4uA27h09F03JlKX9XQIBgxnRbhNZlfXiC4YGm254BozxENOGF0eLCf9M+Tx8zPo/a3NMJRhM2kuDf4lEBqYnabKz6uDWz/RLVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Kjl0Krxz; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=xRRxzHXcG6ByeGhUqK+NNCEcYuk1Uf6B9ch89Ph+eL0=; b=Kjl0KrxzE3EP9jgIEIUrAgV3MF
	k9Ffno18+ejTyi8laHQ/KWFx/TREke0bS7atgVumJ3CGgvGkHomk/kFb993lhu2ASWEIjYUgx/UQF
	aAwIE3hWTSUxoG3p9rT/fjUDx+DVOJ16aiwyRjllPXvIDou4GqkyX2UDGrMODRB77WHmYdq/2w711
	9LPa3xH8+K8rVd2IXl4huBef9r3dHxOICc14qAt3ddoV38EImRUb0j5ZfUb664Auaf4B39onmx92Z
	SPvJ+J6hEeukg10LTMbdkZ39mnoqzM5E3K+6/SOfDhdt0u1zM3dzDJTu2tghPnu/CBF5YRRlC8iSD
	uomNRjJA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t4kQ1-00000009Grr-0CSL;
	Sat, 26 Oct 2024 17:17:41 +0000
Message-ID: <0ae13ad4-342a-48ca-bd7a-8f15f6d99504@infradead.org>
Date: Sat, 26 Oct 2024 10:17:35 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] Documentation:leds: Add leds-st1202.rst
To: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
 pavel@ucw.cz, lee@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <Zx0BKtXo55D_pCGk@admins-Air>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <Zx0BKtXo55D_pCGk@admins-Air>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 10/26/24 7:48 AM, Vicentiu Galanopulo wrote:
> Add usage for sysfs hw_pattern entry for leds-st1202 
> 
> Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
> ---
>  Documentation/leds/leds-st1202.rst | 36 ++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/leds/leds-st1202.rst
> 
> diff --git a/Documentation/leds/leds-st1202.rst b/Documentation/leds/leds-st1202.rst
> new file mode 100644
> index 000000000000..72286a512c69
> --- /dev/null
> +++ b/Documentation/leds/leds-st1202.rst
> @@ -0,0 +1,36 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +============================================
> +Kernel driver for STMicroelectronics LED1202
> +============================================
> +
> +/sys/class/leds/<led>/hw_pattern
> +--------------------------------
> +
> +Specify a hardware pattern for the ST1202 LED. The LED
> +controller, implements 12 low-side current generators

no comma     ^

> +with independent dimming control. Internal volatile memory
> +allows the user to store up to 8 different patterns.
> +Each pattern is a particular output configuration in terms
> +of PWM duty-cycle and duration (ms).
> +
> +To be compatible with the hardware pattern
> +format, maximum 8 tuples of brightness (PWM) and duration must
> +be written to hw_pattern.
> +
> +- Min pattern duration: 22 ms
> +- Max pattern duration: 5660 ms
> +
> +The format of the hardware pattern values should be:
> +"brightness duration brightness duration ..."
> +
> +/sys/class/leds/<led>/repeat
> +----------------------------
> +
> +Specify a pattern repeat number, which is common for all channels.
> +Default is 1, other negative numbers and number 0 are invalid.

   Default is 1; negative numbers and 0 are invalid.

> +
> +This file will always return the originally written repeat number.
> +
> +When the 255 value is written to it, all patterns will repeat
> +indefinitely.

-- 
~Randy


