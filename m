Return-Path: <linux-leds+bounces-5168-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36336B15603
	for <lists+linux-leds@lfdr.de>; Wed, 30 Jul 2025 01:32:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62EE33ACFDA
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 23:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA7B1C5D5A;
	Tue, 29 Jul 2025 23:32:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qXY3+Dc5"
X-Original-To: linux-leds@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E9917BBF;
	Tue, 29 Jul 2025 23:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753831924; cv=none; b=Mdz3RyJR1nVP5r66+R0n2MzeB8sV7UHWv7nGAluK5GVBGoRvpKmCi5GyUe8OUD8Y0ftKZ6+ltS5jRZeD9UqIOg7iJOgK/o6wOkkDrCly3vZTO5p/Y0UiNvxA0FnKajb4zKVBEHTnNhsWdkv/igLRz0ordC20kHtMI1b24PwVOig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753831924; c=relaxed/simple;
	bh=ik4JzEqXWCvy4oWAIHC9vaYCZ2WMR45ojVuYawstmDg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aqKGD6va1c9w9LLj/CZRVN+dWO6/g+YwGRpKJNUIa3D3bkF0Jokkw80kP65c/kjErBzcCEbEDJugC2ag9ae0yOP1fMGb5Ve3VRlolxULbxbkcjtV16eX0qMfRh0dYhCINdEm3HrkdIhCKFdKOzJUZx/GAmRcSuMfP1TFyVYrr8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qXY3+Dc5; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=NjWBJG7tnyKrxfyIh+OKHLF6Inx68AtsDOyMPzd00Xo=; b=qXY3+Dc5FFgFT73FrOZTpW43H9
	1MOGRE3croRQW30WJYSzm3QEhT04m0KgdTav2qWvyXm/ZJbq25Oz315aMkjU5SbGI9B3e1uqmVMkA
	h2MCi4SXAlVwRURC5p5F+6z2nRbfVU0AtFJGc4fz2oz6ErPrddFj0bwwwxPsrh45eUrlAE2jGHdhZ
	6+e/JM6RkgS8KWGSYj18rDkF3WkSVFnSRL9K+JsMcpBJQbbsVQuAidJMhsJtKo/bCk4UsrLgeLbj4
	g99plku8t7MAZKXMyVHulmm/x8wgvQaHx7j2jOpWJi1a1jYJoWrIIHobDd9s+qRid9Qwvm/ToKyAZ
	jr0/uOVA==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtnc-00000000IvB-0qmF;
	Tue, 29 Jul 2025 23:32:00 +0000
Message-ID: <70e9842b-83dc-44f8-b27d-260ff9543b36@infradead.org>
Date: Tue, 29 Jul 2025 16:31:59 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] leds: Drop duplicate LEDS_EXPRESSWIRE config
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
 <20250729-expresswire-dep-fix-v1-1-635cd4cc746b@dujemihanovic.xyz>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250729-expresswire-dep-fix-v1-1-635cd4cc746b@dujemihanovic.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/29/25 10:18 AM, Duje Mihanović wrote:
> While moving said config symbol out of the "if NEW_LEDS" block, I
> accidentally left a copy inside that block. Remove it.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/b6c481bb-e854-405e-a428-90301789fe20@infradead.org/

s/Link/Closes/

> Fixes: 2cd0d1db31e7 ("leds: expresswire: Don't depend on NEW_LEDS")
> Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/leds/Kconfig | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 6e3dce7e35a490df050cb4cd8e98611028c8dce1..8098b7b49c9decb591a894fe514a7ee757da5b44 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -214,10 +214,6 @@ config LEDS_EL15203000
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called leds-el15203000.
>  
> -config LEDS_EXPRESSWIRE
> -	bool
> -	depends on GPIOLIB
> -
>  config LEDS_TURRIS_OMNIA
>  	tristate "LED support for CZ.NIC's Turris Omnia"
>  	depends on LEDS_CLASS_MULTICOLOR
> 

-- 
~Randy

