Return-Path: <linux-leds+bounces-1414-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BBA89698D
	for <lists+linux-leds@lfdr.de>; Wed,  3 Apr 2024 10:51:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8274D1C25EB7
	for <lists+linux-leds@lfdr.de>; Wed,  3 Apr 2024 08:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAB5F5C61A;
	Wed,  3 Apr 2024 08:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aFjr2V9x"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5487E6EB53
	for <linux-leds@vger.kernel.org>; Wed,  3 Apr 2024 08:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712134269; cv=none; b=mhaYVcGtnbL0A4qjxZ/zDq1Y2TRucKWleST6fUIJkLO6z3vcsdMadugn3hQLL4T2+A81vfJrCTkQrFOCFKWN9fYFCUwbX9RKr+rIaQbptpJUnX4yCEs+o0e32Z9EEMmAGS385J81p/vNzYoKpPslt997FQ36GHiaRijiq9QS8bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712134269; c=relaxed/simple;
	bh=yNeV4z/PWJVyzzzivGAxNQiXug1KMK16UfKr4VpFu10=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ILillPJxvQ35iDWDmwNGOOpccgsnPZ+0SmEwwQuY9CEnDrwAPntUXjjCjThJ42cjEiVGhcoc9UrGjzq+kZHgta4RCHY/VZRuzHUzcReEc8yEjqFjky1FPUWx3HBJ+ly1LCXqkuHGJEf5zR5MtKqFX+r4ojzIaEsRIHeRVNY8b8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aFjr2V9x; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712134267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ftwTQ4DomVP4vKswlA/sGzSPQmPFYykxxeMk1bR9OoQ=;
	b=aFjr2V9xAoYygLImlXWr5gCTolJoAbPXCaLr6V0rCAZxumBzjgdxJMNAK76JsbzpBRFSJ3
	eYaiZOhstz2qNKt4j15PqECpYg1Vxr4sY2i6rxmNsMj8dSxZA9mnEKYHkZWInXrRVV9zGu
	sWGO6fCaqPDyS2KyQZB3Fos7eSKMGMg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-mNSEYbTDN9uY38yDAjGLKw-1; Wed, 03 Apr 2024 04:51:05 -0400
X-MC-Unique: mNSEYbTDN9uY38yDAjGLKw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a4dfdbdaf06so349018866b.3
        for <linux-leds@vger.kernel.org>; Wed, 03 Apr 2024 01:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712134265; x=1712739065;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftwTQ4DomVP4vKswlA/sGzSPQmPFYykxxeMk1bR9OoQ=;
        b=bzUM6lB3u6KOgdlVYApzSl8ky/M9uD24fO0HuR11gC1DUzeSdm2VOm6/yc/4U4lktb
         9BowYiBeEXJ8lC5jogYhrRwQkWKAeWn9tzeofhzfqeKtz6Qt4kwIrLfoqQybh8fdslDd
         AeL4clacgWtOg7RrV9oJO0PhwkUx7momT2lsHlD5Va4FBFvNqM75KO2A2IxirfkOdYQn
         crXRZ2Qyju1o15yJdYXf8M62BxeodCRqeI2+PJRZedsuFRkfPoc/EIzcOleTvHPzR3Wn
         R7TRbHjUqe0GZeU2NYH2p7O3LC1clKIw1jgQgyVtsQl8mzUOTZVjakyTRvY8WgwtTJts
         QFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8kD/4zxkerkWlL6jyscWQt7vCzadMjjxglQKTLcEVMbL7SA9rxbTPRqweHjJqopFKgzISbzb5n1cg4P6xOXz5RN17NbmvMFL+SQ==
X-Gm-Message-State: AOJu0YwET8ApMY+bgavqMD7UYHK8/pL7/nSYcS8srsbMKCtfVupBREnt
	8rdTzrPb2kNOUatI3qDf2M8uZbdjvwjZ7eXdq2ZeNpPqRgPl1TQbImdOMs4XWUzUEuKnKm3FrB+
	/cERG/+eiVM074N1pXX9fHleR3WrIwWQY9VMJRHmKDkUHYuMU3Et5ulIHA7M=
X-Received: by 2002:a50:9550:0:b0:56d:f375:29a8 with SMTP id v16-20020a509550000000b0056df37529a8mr2256043eda.36.1712134264874;
        Wed, 03 Apr 2024 01:51:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwT6tT+kScrk/JwtM/C4YQ4Oeghtzd6zvvvgwsKFGDFynobYE/66/6Tw6MA36U5g1BHNJNXA==
X-Received: by 2002:a50:9550:0:b0:56d:f375:29a8 with SMTP id v16-20020a509550000000b0056df37529a8mr2256031eda.36.1712134264599;
        Wed, 03 Apr 2024 01:51:04 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i23-20020a05640200d700b0056ddc4415eesm2723204edu.14.2024.04.03.01.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Apr 2024 01:51:04 -0700 (PDT)
Message-ID: <98229bf5-791f-4914-82de-7cee15bc41ce@redhat.com>
Date: Wed, 3 Apr 2024 10:51:03 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: leds: add LED_FUNCTION_FNLOCK
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Gergo Koteles <soyer@irl.hu>, Ike Panhc <ike.pan@canonical.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org
References: <cover.1712063200.git.soyer@irl.hu>
 <8ac95e85a53dc0b8cce1e27fc1cab6d19221543b.1712063200.git.soyer@irl.hu>
 <6b47886e-09ac-4cb9-ab53-ca64f5320005@linaro.org>
 <39acb3b9-a69f-4654-9749-a9af42fea39e@redhat.com>
 <368e9817-0000-4f69-9f09-568827466121@linaro.org>
 <4956933c-49c4-49ab-a91a-7e0efcc211d5@redhat.com>
 <17a700a7-44f0-4e46-9a0c-4c2da44c9e27@linaro.org>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <17a700a7-44f0-4e46-9a0c-4c2da44c9e27@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 4/3/24 10:46 AM, Krzysztof Kozlowski wrote:
> On 03/04/2024 10:39, Hans de Goede wrote:
>>>>
>>>> must have a dts user before being approved too ? Since
>>>> that file is included from include/dt-bindings/input/input.h ?
>>>
>>> Wait, that's UAPI :) and we just share the constants. That's kind of
>>> special case, but I get what you mean.
>>>
>>>>
>>>> TL;DR: not only is this patch fine, this is actually
>>>> the correct place to add such a define according to
>>>> the docs in Documentation/leds/leds-class.rst :
>>>>
>>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> Thanks. Is it ok for me to merge this through the pdx86
>> tree (once I've reviewed the other 2 patches) ?
> 
> You need to sync (ack) with LED folks, because by default this should go
> via LED subsystem.

Ok, will do.

Pavel, Lee can you give me an ack for merging this through the pdx86 tree?

Regards,

Hans





