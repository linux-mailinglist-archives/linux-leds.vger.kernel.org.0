Return-Path: <linux-leds+bounces-6383-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 288FACAAFCC
	for <lists+linux-leds@lfdr.de>; Sun, 07 Dec 2025 01:37:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 23CB13005032
	for <lists+linux-leds@lfdr.de>; Sun,  7 Dec 2025 00:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE861D5CC7;
	Sun,  7 Dec 2025 00:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rIo3SETA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C071D5ABF;
	Sun,  7 Dec 2025 00:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765067866; cv=none; b=VQ1g+b9opPlhwmj6MCuizbpy9/3arn+8BH+vnm5Xkx2hsPLalCUMsyE10rsZVLR7OlD3kaF+VZBEDnpZY983ZALf54k/v3DC+eTJMV2jIah4152WRjzDX7V2swjXjGPzOzO4gNsgslqONLumZn1Bewad0nVezA/oA1NtA+Vd9yQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765067866; c=relaxed/simple;
	bh=r7gYtfssY56Xn6buD1OxmqHdEFBHTAJfL6NFw/5gMEg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9Ua4PvO5/O7zQVo4QhWe/D89oXvoACBdidFmXphsDQn79u5y7A84k+8Ynkr66WSx1zor3J62TFeKdyGpP+I5Vs2mu5Fydd2vA63Z6ncIrnZ5tcL7/sxbbVkO1bPvLVN7EGJMdWo7/2VPXHX/vqXxaPg4l0TyMAAUUzcAhv/byk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rIo3SETA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F1FDC113D0;
	Sun,  7 Dec 2025 00:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765067865;
	bh=r7gYtfssY56Xn6buD1OxmqHdEFBHTAJfL6NFw/5gMEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rIo3SETARYzfwXu5dNPM4XOV6sSwLWQ5w0ti20oGy46PKgblQ7fRUiZIKY9ltEHB/
	 lu8MAUGe55rQNPuyZiuxKzuWFY1QAOoZqePIOgFbdK3+AAUVKWLNE79nDEe1tVUMIh
	 NY/ggPxIMpodzFH5PB0dIXOt7NpN9FagATIWK82+bNfO4L/u2snxtMLg9Gfly+aqnw
	 UdkCKo9LqTOcmM4kxx8C1L3wRVY9TinJOVBfMHs3aWq8S/yAkM0ixBCL6qGh0cYoo9
	 X+2gvqn2QsHPCXx2dfcDt6JVNCHjxM9PbAHAaLUg0/8yXY/PoP1OolUz7sMNrrPnQH
	 o4835jGpN74hA==
Date: Sat, 6 Dec 2025 19:37:43 -0500
From: Sasha Levin <sashal@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org, Stefan Kalscheuer <stefan@stklcode.de>
Subject: Re: Apply ccc35ff2fd2911986b716a87fe65e03fac2312c9 to 5.15, 6.1, and
 6.6
Message-ID: <aTTMV34MPzGJc6TK@laps>
References: <20251204000025.GA468348@ax162>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20251204000025.GA468348@ax162>

On Wed, Dec 03, 2025 at 05:00:25PM -0700, Nathan Chancellor wrote:
>Hi stable folks,
>
>Please apply commit ccc35ff2fd29 ("leds: spi-byte: Use
>devm_led_classdev_register_ext()") to 5.15, 6.1, and 6.6. It
>inadvertently addresses an instance of -Wuninitialized visible with
>clang-21 and newer:
>
>  drivers/leds/leds-spi-byte.c:99:26: error: variable 'child' is uninitialized when used here [-Werror,-Wuninitialized]
>     99 |         of_property_read_string(child, "label", &name);
>        |                                 ^~~~~
>  drivers/leds/leds-spi-byte.c:83:27: note: initialize the variable 'child' to silence this warning
>     83 |         struct device_node *child;
>        |                                  ^
>        |                                   = NULL
>
>It applies cleanly to 6.6. I have attached a backport for 6.1 and 5.15,
>which can be generated locally with:
>
>  $ git format-patch -1 --stdout ccc35ff2fd2911986b716a87fe65e03fac2312c9 | sed 's;strscpy;strlcpy;' | patch -p1

Queued up. I just picked up the dependency instead of changing the patch.

-- 
Thanks,
Sasha

