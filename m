Return-Path: <linux-leds+bounces-4535-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F118A996E2
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 19:41:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C11F317A4E0
	for <lists+linux-leds@lfdr.de>; Wed, 23 Apr 2025 17:41:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EFC28BA93;
	Wed, 23 Apr 2025 17:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JGN3gDJn"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D8A289373
	for <linux-leds@vger.kernel.org>; Wed, 23 Apr 2025 17:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745430022; cv=none; b=MBNN8S4inYFDWSg0ApQjm4vK/WpbXU8t3xvAEkkBk1n6E1xdxBoaTTIC2sd9nDYjVySSIjkIj4lQGQbywvm+WE1sOlp8mPif9cRjbPcFOB8yUvZqqVClyIFl6KgFem4BoX8HEBtfegXqZnHuFkVsuGRnVdtL6hblE+DqfkVkZrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745430022; c=relaxed/simple;
	bh=gq0lJxz5PvsTljDzovSHYsWFyp28Vf8lY/vlKTTOIEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b/vrj0XBW0pUZRpMei5emNq8Q1s9W9BrxcFwWTW23312kLJd666OQWdUj322IJ+yp9iTez3VE/z0rYtOJbcD8dC/ga78Na8T3FATrEg/U1KWgn9TynMElz4jXj7czJqUicn5r6nhtGTzBJu4RyBrJPnGKmzA2WBzopuYbvlA8Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JGN3gDJn; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so26957766b.1
        for <linux-leds@vger.kernel.org>; Wed, 23 Apr 2025 10:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745430019; x=1746034819; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nVGWJ1dr5AYSO3m4fnqiIeoBn0aY9z8ooa7ipZf1hvw=;
        b=JGN3gDJnCf5zg0aqfjdZQh/D5iplPv3Y+pW0f/M75j8XAsNOUut3z1m8B/pAypS0kc
         +p2ij1V6a4jnpAoRhqU6qL2iS/8KUplOtjfegrwRw64WdX8Bv6xwCacQZ6uur/ksRQaP
         T81vilzNH6jAw7Duv7pREI+8sHfpg4VgJx2k75Az3jE0bCaBcn55HJF2KRy0tSAQ6UQb
         twdlVFsZ8ZDd+wT1RBt3iWpX/ipLywGEYA8ATiS84ntOo9RK0Aa5b5uq5f0Fga8My4aj
         Px67ZJ468cJI+6OvWQ5oNsgr8Ph98oKZpns62zQyf2GjmcOeqXiEjAJrRltFFKMeP/FL
         fdWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745430019; x=1746034819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nVGWJ1dr5AYSO3m4fnqiIeoBn0aY9z8ooa7ipZf1hvw=;
        b=Wzeg3NXbOkMbc8ibASxEMuHoDTyICITwCwO/J/xOqv361U5cglyTGu4NxCTvmUspve
         9DzW/kGL6sn3Of2jwpzdSUUnN2UYUy5lSnVwVnnZIZWTQBeiQF5zkbRd/PWCWzuStD7d
         DMYK8eys6ykok63vDQqJVcezs/zuGVbYr75jM/2zUro+g+tO/cGjbht66yK0ZgTZ8Rs3
         setnms45EOIyS+BZVyln/WfmLSfCr2pLVWMRw1AIVUgMXf4OMcZAa6vAwb8l+NyZq8oe
         yveji8O5KjsPJv8TqCjmuqwNXvoJphZ00JV1VlPTqbDAVTX+eU6xC72SK8dfVgZo+J2y
         XLPw==
X-Gm-Message-State: AOJu0YxhvnXQpNtmXf41CU+XG/D5L3Csw+SZBS0u1tTF91stnLqBuUQe
	NonGeRzaIPHlq/ax/m7o9Q6vyq1ehwPBPXrN2SpFcpDh/LhcCb7ZX4QUMA==
X-Gm-Gg: ASbGnctpITT9r+/nVo/aYCKJk1E5fLlfasdjewk4RR1KsWmuM9gm5h+mHjVDbpw4/fu
	VVMFh5BQkhTae2HffYvTT1Ch29vfh+oMMXHJLNBIAYSpXVgrZfAD8CwcKJwwmuyRgW8afn4ZOcd
	yyKp98Y+dyJhqpECJmJevl7coJ0SCRQ2aexOIdrdCQ+8UBUGNTqd0SuTalCta7Xm13k8YSOtnvd
	gFC3LMHjnzYIKOXy+K99FHVCNL8ypvOLwfT5rYnbT2S1laK1in+uQBKeT1E6+5b1VOF+GON4BPz
	0aEOEX+0hfPad/LoNL1hYxvnrZd+vxYCE7v9cnoND99siFtro+wx1w==
X-Google-Smtp-Source: AGHT+IGYkfSMjhRFjvz/O7d85i/mfvDBdN2RINXnmLLwXUOj6CrpVt2QaBVpG6UJetDRL5+PanJ1bw==
X-Received: by 2002:a17:907:26c3:b0:acb:b1be:4873 with SMTP id a640c23a62f3a-ace54e6ccc8mr1038166b.2.1745430018466;
        Wed, 23 Apr 2025 10:40:18 -0700 (PDT)
Received: from [192.168.0.131] ([194.183.54.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef468dfsm826621266b.133.2025.04.23.10.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Apr 2025 10:40:17 -0700 (PDT)
Message-ID: <2481f089-7da5-44fe-9e74-7dbcd64e486f@gmail.com>
Date: Wed, 23 Apr 2025 19:40:15 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: LEDs Testing Framework
To: Lee Jones <lee@kernel.org>, pavel@kernel.org
Cc: linux-leds@vger.kernel.org
References: <20250423092551.GA8734@google.com>
Content-Language: en-US
From: Jacek Anaszewski <jacek.anaszewski@gmail.com>
In-Reply-To: <20250423092551.GA8734@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Lee,

On 4/23/25 11:25, Lee Jones wrote:
> Good morning Pavel, et al.,
> 
> Is anyone aware of any LED testing frameworks?
> 
> I would like to author one, but I'm hesitant to reinvent the wheel.
> 
> Kind regards,
> Lee
> 

AFAIK there is only tools/leds/get_led_device_info.sh script written by
me few years ago, while working on LED naming standardization.

-- 
Best regards,
Jacek Anaszewski


