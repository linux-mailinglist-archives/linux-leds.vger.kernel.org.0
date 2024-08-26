Return-Path: <linux-leds+bounces-2534-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB6895FB39
	for <lists+linux-leds@lfdr.de>; Mon, 26 Aug 2024 23:08:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5499C282FBF
	for <lists+linux-leds@lfdr.de>; Mon, 26 Aug 2024 21:08:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81178199E9F;
	Mon, 26 Aug 2024 21:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UEHpjAXr"
X-Original-To: linux-leds@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7641993BA;
	Mon, 26 Aug 2024 21:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724706492; cv=none; b=oi9AcNVJRDM2w8mgwIWs1dKo4jkUIKhIbcAPEam6qo9rNBTxXGEKRamct9NCm+f8VYWFWB2/hZHaagCzUZMN0ZMyfz2IT783cnuWcgQ1+2mWb/TrC/Z70oR7RePjh04IxgL9IOiqFwVfXoYegndQa20hqM7zRVbQhDNZA/vmWGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724706492; c=relaxed/simple;
	bh=Qw+J6iD8Pg10UUZ64viFHuUl9HmU6O+5V+P2eYkl2uo=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=U086LN9wc5fEhIo+C+oimkE8yDzMfdJr5e+rZfLb3j9bb5uTXfOb0+eJe1O0VsJXbqUkr1kavjCA4RjxWFBXL040H+m7001X8BJSdXkZXsaECPUae1RzYCxqH0XvXIYXLeiWiwVCZFNKy8AtVWfRfCzh7anoky1CHORsRbpX1N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UEHpjAXr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E339441AB9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1724706490; bh=IaKvDgSFx1cLKXSEhOkfh1OgCi/I6RmNfUqoLjrWYbA=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=UEHpjAXruquSXyQy9oIQqAsVq45ldJ6EaJ6o97Krv1vG5RVTPWZXSJ02Re8hsYUG6
	 dwMZ8VMTl60xabQlfhYOumNwPp0BE6CXRhpHPDZVHtrKMnr0x2bnrUtQrFqf1ScttS
	 sReuHrRyRrwMNHfOaH9WnMUkli2eo0uNwM+/P+mis/IlvarIvF89S6YIAJ9sgqWn4O
	 Y940rMKLYi5Mif6g8HQUObZYrd5eD0WY2N1gG2ewHB83Es2ek9tstvhuIYCCoAN0E+
	 YnKc9FGpzJdE8xG12gvqQrfKMuHl5OHW2s+9MXwrSkKyCvT4UHc8FFfn/HKRekNFHE
	 Usba05vgIIIrQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E339441AB9;
	Mon, 26 Aug 2024 21:08:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Aryabhatta Dey <aryabhattadey35@gmail.com>, vadimp@nvidia.com,
 pavel@ucw.cz, lee@kernel.org, linux-leds@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: leds: fix typo in
 Documentation/leds/leds-mlxcpld.rst
In-Reply-To: <5nib2kj6uh7lkafrmmwcjpeyvs7megdfmseftkjws2wcuztoyc@yhidnl4ilbok>
References: <5nib2kj6uh7lkafrmmwcjpeyvs7megdfmseftkjws2wcuztoyc@yhidnl4ilbok>
Date: Mon, 26 Aug 2024 15:08:09 -0600
Message-ID: <87mskz6lhi.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Aryabhatta Dey <aryabhattadey35@gmail.com> writes:

> Change 'cylce' to 'cycle'.
>
> Signed-off-by: Aryabhatta Dey <aryabhattadey35@gmail.com>
> ---
>  Documentation/leds/leds-mlxcpld.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/leds/leds-mlxcpld.rst b/Documentation/leds/leds-mlxcpld.rst
> index 528582429e0b..c520a134d91e 100644
> --- a/Documentation/leds/leds-mlxcpld.rst
> +++ b/Documentation/leds/leds-mlxcpld.rst
> @@ -115,4 +115,4 @@ Driver provides the following LEDs for the system "msn2100":
>  	- [1,1,1,1] = Blue blink 6Hz
>  
>  Driver supports HW blinking at 3Hz and 6Hz frequency (50% duty cycle).
> -For 3Hz duty cylce is about 167 msec, for 6Hz is about 83 msec.
> +For 3Hz duty cycle is about 167 msec, for 6Hz is about 83 msec.

Applied, thanks.

jon

