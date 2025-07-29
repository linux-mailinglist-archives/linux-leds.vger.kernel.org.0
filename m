Return-Path: <linux-leds+bounces-5169-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6381FB15609
	for <lists+linux-leds@lfdr.de>; Wed, 30 Jul 2025 01:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B741818A7F7A
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 23:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DCE2264BF;
	Tue, 29 Jul 2025 23:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cWcKApOF"
X-Original-To: linux-leds@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E09A17BBF;
	Tue, 29 Jul 2025 23:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753831966; cv=none; b=c1cI8P+zLW/CopEbjR/Pl6cvfksY+xxHHYW/pUldUNz24UkTBR20APnD02Tj3ol/IgRdvZg0wPddN5uVmfWV1ARz8KALVzpqDt2N3eIRWXVujqNS/ohqKhexBamPw4Rh0vvhZwVJHK7efHnb7iFjzkefO9yr+eGPyIBCYBXtrgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753831966; c=relaxed/simple;
	bh=ZhV2iSmr+wOFk6d2VD9TY7r9R1HzY82NX0FCmJEjrZY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qip8XvEzFt2xL9JRRnVEpOMY5oAzshyMnkPS2V+RI3Wtmddz3ieZxtXduRzPmeBNklK9pqNurFFLyZciTuzJ6iO2gP8K8z803HvUk7JI4Y5gex/niWZPNNNk4KKWUwbNa6Yr+skHO8rbhxt41swTrnFe/6niyQ/Zyp+vymK7D5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cWcKApOF; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=XjCUQoijn+VHziSL44vr/+oUMR1LsJbsYTyzN9g744s=; b=cWcKApOFbv58gk1Y1Rd9evKWwF
	tFbXZOrBQPHQIxLF2QLjOhjP153OAtT0yxmHr6JQ0OVISfq2NAWAOgo3kPlWS+T5wkRmihgBDyeSV
	f1vXImMbxVnxKkdypd7YhOg8++gwhObdsIB1shvrvM3vo8wwJd+75JQKW6ghAlTRiduUCO+D1yHvA
	9JFaE2t1iqpWcUlEvC/XxLW6XDOTeavoMBS5p5RAQrcAhBvBcjBJEZmFIkTNXLqzW0jhdMAxsufuP
	oI/Xoumiu79wjHv30YSKvyLLF/ArQbLk/7ZbTiviPZezVZz6xvSj4jPWq2vsSXXMXUEVbzQJ1V01K
	FHumHPPw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugtoK-00000000J0w-2haF;
	Tue, 29 Jul 2025 23:32:44 +0000
Message-ID: <2d6cb0c8-6fe1-43d9-b744-0a0a95cf30d3@infradead.org>
Date: Tue, 29 Jul 2025 16:32:44 -0700
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] backlight: ktd2801: Depend on GPIOLIB
To: =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
 Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
 <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 7/29/25 10:18 AM, Duje Mihanović wrote:
> The LEDS_EXPRESSWIRE library used by the driver requires GPIOLIB. Make
> sure this dependency is not left unsatisfied.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Link: https://lore.kernel.org/all/b6c481bb-e854-405e-a428-90301789fe20@infradead.org/

s/Link/Closes/

> Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/video/backlight/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
> index d9374d208ceebbf8b3c27976e9cb4d725939b942..37341474beb9982f7099711e5e2506081061df46 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
> @@ -185,6 +185,7 @@ config BACKLIGHT_KTD253
>  
>  config BACKLIGHT_KTD2801
>  	tristate "Backlight Driver for Kinetic KTD2801"
> +	depends on GPIOLIB || COMPILE_TEST
>  	select LEDS_EXPRESSWIRE
>  	help
>  	  Say Y to enable the backlight driver for the Kinetic KTD2801 1-wire
> 

-- 
~Randy

