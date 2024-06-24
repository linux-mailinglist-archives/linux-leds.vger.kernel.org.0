Return-Path: <linux-leds+bounces-2110-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7D59157E0
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2024 22:20:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4942EB22E5F
	for <lists+linux-leds@lfdr.de>; Mon, 24 Jun 2024 20:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F5D21A072C;
	Mon, 24 Jun 2024 20:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jGnHGt9F"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DAD1A070A;
	Mon, 24 Jun 2024 20:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719260430; cv=none; b=W8cBQBBdDXc06RSSO5qJ6LO87ktJBM/bW0cb6/eOh8RR57iFE6O0pCmCTPIYMIZA4G3UQM7uySN8aNaJMq6+4SB8W6OWulhOyDxux4MgUQ3Nq7+TPCzk4x5F3QsHTNhqOtCcJjqS/gOOen4csN57DSHlrOV+NBU/0V2yWcrhIFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719260430; c=relaxed/simple;
	bh=nMF+0Qtz3H5aceofx0LBLmcNh/Eg6jZEP2NiKglb0yc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=srO3q4eO7BXht2rqietenl4yDJCqjNOTfvXHx4L4cVoGQSwhWu+7Om8C+2EfUQaFCnMrUngnddjUJRal7KRlIfUm9EK0+sQcK+14VFRcvIUZtM4BEUYtVSZeTbeh68M47Db0V9iPmnw2neLVRzqn1TYzogL+alj2P17d71qJ0/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jGnHGt9F; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a62ef52e837so577880866b.3;
        Mon, 24 Jun 2024 13:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719260427; x=1719865227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7rsqJbWR3EwJq15ksdjT+Zgev1iG+0iWaJX+2TtuE24=;
        b=jGnHGt9FUVULULwjQh83b/X8pUzixqG2lN4CRyJnYkDuws7VdUST4xHhGDMCewhVtU
         NW8y+9JUf33hwGKph+nIo2C3uHZQ/fMCRi2MahFryqg+od2QDe2/uBRWjM7ake+TYl6Z
         FKLzZnKA0rTnj4ZV+CTC0E92+za7jQLPJIg2+KzEw8S/XGSztYZQRgL9LHGMt0PgGp7M
         SH2e9dZUD5SC5x53DK3X6ppktpnU5FcFPFpuE+zEP5yw9EycJhSE1Fc6hzTVhDBDa4Tg
         XLaNvBLhPFLR1El4WKcqPJl2nR410ZiKmXzfFZRj4AeBhqzG9m15SDBsZwcjczhCRBac
         DOPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719260427; x=1719865227;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rsqJbWR3EwJq15ksdjT+Zgev1iG+0iWaJX+2TtuE24=;
        b=Jtv5B3RImOg1pjyYrxnsSKw7/QHh2XidjOzCwjdPfYozJ7cIhY2ll7482y1QYkvjK8
         P/Y8Fk5wC5qM5Gi+eeVsJT5La4m8nX7ezMbYJB4sCrNUV63VJk/fea/2BDlelGHY0Z9r
         eN/YEIVXB/SZZbY/NDA/M32jWN0M+Yn0obql0wWANnW4AYlDawFFfSXqn4njBtyC2S/s
         SnDK24MQNCi+Y76xVT0/VwjTpjrStUnvKLxXu3e6JZKcjXQRmikYjuYxQ8XPyW7KCglz
         qywoCcSDHBlvXQ2aeMKwwGmnMBkKFJI1nLbMm2vIfAJ9tCGMP+QSEjyaHHdODi6d4uNy
         oD0g==
X-Forwarded-Encrypted: i=1; AJvYcCVgWyk3NU87aFYqs99o639p3vGk4WPakywHz5orObHFK0jsuenS/pWDyCF4hPa8XGNcCgDi9911YDNV6+F6vGwcsChYGyXZNkYnXksr3w7Mlj60Nz9UVoEwlJ5uFhgTMENq7O2NpLiWxQ==
X-Gm-Message-State: AOJu0YyR1eUvK6VWK1hNeu4QRXM9Bvf/Wz+YBPwmwdLVD0OJk+qLL+Wi
	9K5wipb9hwJXq/C/lhegsRiITVreFX2m/QiTx9BMd9BvySTE/Qrb
X-Google-Smtp-Source: AGHT+IEIEPMkxGdBDl69NdaTaa+1rxBT8vbooZLgAhUobaLPeSAZK9ZcLOtD8dT34AN4vTkNsaw85A==
X-Received: by 2002:a17:907:9116:b0:a6f:b41d:237b with SMTP id a640c23a62f3a-a7242c3f5f3mr377468466b.32.1719260427069;
        Mon, 24 Jun 2024 13:20:27 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c07d:2d00:ad78:a407:846a:969b? (dynamic-2a01-0c23-c07d-2d00-ad78-a407-846a-969b.c23.pool.telefonica.de. [2a01:c23:c07d:2d00:ad78:a407:846a:969b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6fcf5602a4sm451068066b.145.2024.06.24.13.20.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 13:20:26 -0700 (PDT)
Message-ID: <778ec5c9-9ec2-4496-a458-b323d8904b0d@gmail.com>
Date: Mon, 24 Jun 2024 22:21:18 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] leds: core: Omit set_brightness error message for a
 LED supporting hw trigger only
To: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org
References: <20240613075712.2479669-1-lee@kernel.org>
 <20240620090932.GD3029315@google.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240620090932.GD3029315@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.06.2024 11:09, Lee Jones wrote:
> On Thu, 13 Jun 2024, Lee Jones wrote:
> 
>> If both set_brightness functions return -ENOTSUPP, then the LED doesn't
>> support setting a fixed brightness value, and the error message isn't
>> helpful. This can be the case e.g. for LEDs supporting a specific hw
>> trigger only.
>>
>> Pinched the subject line and commit message from Heiner:
>> Link: https://lore.kernel.org/all/44177e37-9512-4044-8991-bb23b184bf37@gmail.com/
>>
>> Reworked the function to provide Heiner's required semantics whilst
>> simultaneously increasing readability and flow.
>>
>> Cc: Pavel Machek <pavel@ucw.cz>
>> Cc: linux-leds@vger.kernel.org
>> Suggested-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Heiner, you good with this solution?
> 
> A Tested-by or Reviewed-by would be good if you have the time.
> 
>> Signed-off-by: Lee Jones <lee@kernel.org>

Reviewed-by: Heiner Kallweit <hkallweit1@gmail.com>



