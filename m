Return-Path: <linux-leds+bounces-8379-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNJYDgWmGWptyAgAu9opvQ
	(envelope-from <linux-leds+bounces-8379-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 16:43:17 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC5C603CD4
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 16:43:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5E76A302F4FB
	for <lists+linux-leds@lfdr.de>; Fri, 29 May 2026 14:37:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631C33ECBCD;
	Fri, 29 May 2026 14:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="QzqIvUB/"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC273E51E4
	for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 14:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780065425; cv=none; b=M8IuaBtpiLmzfs9E06KGGB9tEyW+ys3h5Jp+R6aFVAhkznLVaaiAv9c8/ZFImk6KAXXgG1nDkKLvoE8tEOtjHcwED3VKywmxcGIqjSKyKWCH7Ds0TokQ2pbp4n5uTSiEIv6H4KYmZKWCyvzvrq1SUhX+b+1r2hvCd19qcPoQiik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780065425; c=relaxed/simple;
	bh=RdKPo/J7jz8+PTZxfMlAGNH6ifidcVIKtGtDAneEbNI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tnsue/67mubTjty0Pm35hLb5qFcrN64iotYc2ViZ8KZqERjl5J7GTjPhfhdyyP+OFrYUNb/ICY7ONqAmwSPfkBahp76tLpUju80nzazIEdOdvedkO7gS0bcwaxURtBVpNA7dkOuO/+mfCnVKIOPKs4l9mBvwDsZYlYbifqOQDXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=QzqIvUB/; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a995ab70d1so16322897e87.3
        for <linux-leds@vger.kernel.org>; Fri, 29 May 2026 07:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780065421; x=1780670221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RdKPo/J7jz8+PTZxfMlAGNH6ifidcVIKtGtDAneEbNI=;
        b=QzqIvUB/274GQphujXYx6e2K07fRwbUink7XyH1YfGDfEvGwGL8qOl4eMESOqKPZ3O
         h24KLu9U1BvgZDcv6tNDUgRgxGF16phqp/iXtByqZxwLMVoyhRJNPz5jc2XJIoBdNvgO
         p8yBZ5bT/HG+ku6r7xIWv+/XV1VZNOVLCzqgMqTYKcBkPYcXFjOudRhIBccq/cFYqDnU
         5JRAxTZjdSvU1s+0i1j/V/KpsD9lKYCF7MsBWRzZAjkjy6+1/aiIktNhrnjslL8qkB3q
         Bh7lyhfm1ZJmsHuZE6SO81Akel32SlJsWhOZhfMC44OZn2qR5yc1QIRfgSew2FG+N4Ta
         e9wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780065421; x=1780670221;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdKPo/J7jz8+PTZxfMlAGNH6ifidcVIKtGtDAneEbNI=;
        b=NE8vdNB6TaXuA28G3g7/98aLCu6duiRdWiQyoUScB7K2T8MizgwgS1p0b05y1EpNQz
         b2DEB9lWJYHjOMdSSUiqgkUO6Jc7wozIbh2P7Nsopo2GtTTD8nCqU09MEtvN2rTUZkcU
         7e2Au7gCLWvyG5bTLc+B1tPBanDR3LNjKQ3x1g3OO1QhxilkgPwD6CMw7Ox6AMtf0xly
         ai3DdmtRdP16SLS/j0YNBlgAU4b38a2kx/nFvlXECFwoQZKsnIcGBWu48Ls0t4Ve5AjX
         Icf/vETgIvLtobBpYhM8IJSTe5h6of1VkK3fbE7HQpsalcHfW3eUNugR/CSlAU5pfVLR
         1xDA==
X-Forwarded-Encrypted: i=1; AFNElJ8K/d5FnVquayNACQieE9EwjDRdGSw7IxXyv3KKoJwj+qG4z380ANiv4CCrYBNg1R4fXX+9H73aamIi@vger.kernel.org
X-Gm-Message-State: AOJu0YyjHhARciwHfYBR6DWcPnvhlmoNbSFw4Xi4C/aeIqVxC959TjXD
	pU/NEKFarH02EeLVTNOUFRzbR34u40MCDu1J96fJzeo8hwhEf5I9x1nNej6wqQPMhyYhKw+Dms7
	4Wx1p
X-Gm-Gg: Acq92OEo6fyiuA7YN8HAw5xelbU8pUq0Vcbi2BnbNrGrHo5Npqdx2IKyfj29y0zkp2q
	DF0Yw5omjR9xBHo35OSNQl1yxfFG6LTELK8UVBq6VrOfUTa0XZ5UBb+GD9gmXZ5kBw/H3atYV/K
	pFn0jYIxJ0xCCGZl9fGIdjaaY4zJpuhFLDbr1P2h2pE83E6HQBdykvXE6N+4wPhdRk73a5O9LlY
	XLOaWVMho55LMoBrpTYDfQz3pTch2ORY0C6sIN0mK5/OqxfhxzTLyTfrViEH7nI58DX+DLRFawt
	CxMR8oPaMvfoORTfKS81tiUEsQmTaYKrAnPEKaNqkX0QwQ/XrIaFTv/G/+Zd5DqQgaJ1HZ9raEU
	dz1CS7IyqGWrduaJl++e1pKOdG33UIBMjuCpXCqSTgnrNrGgAOJgLnudwlt47bIgygdpqzS5IZq
	WIe5JwElg+Fh6EQviHp2XXaUyaOyJrztuaHqaIqlndpyvC7wzs+f3vdq2eOWfsM0TvocoxaiwHS
	SpEI5dJiyzlv0ZrppBrGGAjYRiNH5qlAKjIhu0Gkm9uX/jDTIW4HTUfljEy+u89juy1RMFYe9oO
	cWH1G8BJIxf9oCXAjus=
X-Received: by 2002:a05:6512:ac8:b0:5aa:5bae:e9eb with SMTP id 2adb3069b0e04-5aa607c49c7mr35920e87.9.1780065421236;
        Fri, 29 May 2026 07:37:01 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef3556f51sm3888107f8f.25.2026.05.29.07.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 07:37:00 -0700 (PDT)
Date: Fri, 29 May 2026 15:36:58 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Daniel Thompson <danielt@kernel.org>, Lee Jones <lee@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, KancyJoe <kancy2333@outlook.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: leds: backlight: document the SY7758
 6-channel High Efficiency LED Driver
Message-ID: <ahmkirIuOYhd1rkM@aspen.lan>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org>
 <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-1-ec8194bbc885@linaro.org>
 <ahllT_HVTAJ5MbkS@aspen.lan>
 <e3c99fe3-9279-4dfa-af69-d9366ab06837@linaro.org>
 <ahlr5PnX5O0tEd6G@aspen.lan>
 <4001cf6a-b7de-4933-96bc-c9b4ccb53e4d@linaro.org>
 <ahmfZ0tdxbVfD_y4@aspen.lan>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahmfZ0tdxbVfD_y4@aspen.lan>
X-Spamd-Result: default: False [-0.06 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[riscstar-com.20251104.gappssmtp.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[riscstar.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8379-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,gmx.de,lists.freedesktop.org,vger.kernel.org,outlook.com,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[riscstar-com.20251104.gappssmtp.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daniel@riscstar.com,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,riscstar-com.20251104.gappssmtp.com:dkim,aspen.lan:mid]
X-Rspamd-Queue-Id: 9DC5C603CD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 29, 2026 at 03:15:03PM +0100, Daniel Thompson wrote:
> On Fri, May 29, 2026 at 02:50:43PM +0200, Neil Armstrong wrote:
> > On 5/29/26 12:35, Daniel Thompson wrote:
> > > On Fri, May 29, 2026 at 12:16:07PM +0200, Neil Armstrong wrote:
> > So it's not really 2 regulators, and having regulators means the enable
> > signal can be shared and would have regulator characteristics which it hasn't.
>
> Agreed. If the EN pin is merely use as an enable and voltage reference
> then it are not two regulators.
>
> However, it is also *not* vddio-supply and enable-gpios. We don't need
> the board design to check this. The pinout diagram in the datasheet
> should be sufficient!
>
> If you have to activate vddio-supply for the backlight to work on the
> board are you sure you don't just have a misnamed vdd-supply that needs
> to be taken care of? That would make much more sense given the datasheet.

After posting this I figured there is another possibility.

If the host GPIO pin is not capable of delivering the 1mA requires by
the chip then the board designer would have to add a buffer and that
buffer would need a power supply... and that power supply could, in
pinciple, be switchable.

However if that were the case then I don't think the power supply for
the buffer would belong in the bindings for the sy7758 so I'm afraid
whichever way I turn it I can't make vddio-supply make sense.


Daniel.

