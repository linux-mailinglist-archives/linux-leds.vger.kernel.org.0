Return-Path: <linux-leds+bounces-4989-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A107AF7D9E
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 18:20:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AB914A5121
	for <lists+linux-leds@lfdr.de>; Thu,  3 Jul 2025 16:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D42324DD00;
	Thu,  3 Jul 2025 16:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="nU7vv0+C"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A4B24C060
	for <linux-leds@vger.kernel.org>; Thu,  3 Jul 2025 16:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751559609; cv=none; b=EbNYctyFBa9wYzvXVrWfdEl82eWbCjpO7er5rm/syVzltvQGkrdlG9E4ZkSKQyHAr4FzGdURCMgDwFM2I2skPKGpeSnQQ6L6xmfZIkp0Paah2le8sMGpKZy/iY8CBao7uv4Cae0x+4DIchf8SkxTHs/VUa1AnKV9xrTUwgMFTjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751559609; c=relaxed/simple;
	bh=jUo0bz7/9VqLbmKnuHSilXj/iz4VcO9C7Bb8RNU6+Ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUpODrYf4PMnUMhTJrn5D324N91nr3gQtj7b2zsEqcLOIaTOG2DFdJ2kkCNZGMhCpZO97+MZ1kXdxiuwHgbq5u67Wbbj9l2DyYsOKhrMimPlcZcmCBvRJECsISqZaC4Chex45BGTiYRHc7/4ibaAVMo5yk07U0NhWdUknlJ5tXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=nU7vv0+C; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e8275f110c6so4397751276.2
        for <linux-leds@vger.kernel.org>; Thu, 03 Jul 2025 09:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1751559607; x=1752164407; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=niF8wOn9GTKmhQIt/vu6p0p8Z3gSuCH+GiDxHVgqCEA=;
        b=nU7vv0+CWvLUobYkII3uyc+kOF6Eg6O+W7Nllp7+pBahwq0xsliUy7giwMQMNvWgGe
         tGJdpsRaiOH1RQjYSNw/J+Msr/NjEY7g7kpKzjOK0b6M0njwrccLWE3SoW2iKhNj8IBV
         79Fd2mbZBiiVDDakxDSewKydg8DLzxVqp+1kKXm3HeJVU6KHCrjNwUDZrwieibSLAXu8
         drb0XZ15pfrhqfqu6BazEDdxe4jtwNpAANE7lOw1T8BcGW4vLd0J/qTu3GyYfQKZPFkY
         IeZCZmO8wlnqXXExLzOE0xRgoDt3v4AZCgSE4o6NyOG2FYU5XN9Pf3g733NLDLX3mzN4
         Ijfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751559607; x=1752164407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=niF8wOn9GTKmhQIt/vu6p0p8Z3gSuCH+GiDxHVgqCEA=;
        b=sLf6O7Rb1EbM53tC54Biu6JrVOTp7ymSxWXQICX5Mz1L6bUVSPDb1+nIeJaRUdF0lo
         KfUoDd9q1pr3N6JCLRPRc+URqFF0gu/HI1nGzGxcWaOWoQ5Dx1lvCtyG8EN5eDKnwyD9
         bRMTzLe9g4+hYbiRwS1UTF537gJK5hDS0jJFblI4tpAVY/xFZYidb317m4Nqv3A+YrRE
         i8AlYzINTbeQOS0NEoAar56qKsexSVDzoSM0jtUNcSqUjVgQzgfccxR0S3NCDFeO1E4n
         4D8DvEw9+am1IYrx3tgmnfAoghkVmVFDrgY8FNozwApdtQVpaOjXCibo6zHP/7w2TG2u
         kSWA==
X-Forwarded-Encrypted: i=1; AJvYcCV4JKlRq4RUHQdgeULvS/cX//YLUQLGO36w0RColjxpLtWfdzL2pbPpAUlWqWbEG46ONS8RI5WYNnr8@vger.kernel.org
X-Gm-Message-State: AOJu0YwNS+z22SwIcpCcmyhUIMkcVXSfvJI7ze/B0fLOJna/6u9vFCb1
	Jr/UfZKLUDMg+nx29IN0Tn4za/n4y2veLupko3fWk/6RGJ7qmuBYGB/k6LmJOZRyyJA5ZyWiIrB
	pINno2vM9oXnnfzAjCnGcqij7avI38nr476/jLvE8uw==
X-Gm-Gg: ASbGncvttVlzAXV+bkgz5+/6jbDwWm1GIXdvG4P0abXuGFBAKdtchKQHB/Cgn9xbBgM
	XP2P9d4VwUdvUx+j5IjOXLGU0FeB712QxWxf+H7KxoEmFweDjqxr8HprJ6r9N7HNtkxx6Ukh86+
	sqMd7CQJNvgkyElIpQgeQSD/sxlU7LBYO0wK4GXwlO1LWp/xSsBdzfGeXKZZ8cEd46cZJAnsrhV
	cLAXA==
X-Google-Smtp-Source: AGHT+IG9wu0uUr476DbA/3qZswqv3IWybYnshmLMaeMC5NZB1lprrIjfyK4Q5zzWoXuqVSaEu2jCsm7XUNSyqiP3lMI=
X-Received: by 2002:a05:690c:315:b0:70f:84c8:3105 with SMTP id
 00721157ae682-71659128263mr59933107b3.37.1751559606842; Thu, 03 Jul 2025
 09:20:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627-leds-is31fl3236a-v2-0-f6ef7495ce65@thegoodpenguin.co.uk>
 <20250627-leds-is31fl3236a-v2-1-f6ef7495ce65@thegoodpenguin.co.uk> <20250702162230.GY10134@google.com>
In-Reply-To: <20250702162230.GY10134@google.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 3 Jul 2025 17:19:55 +0100
X-Gm-Features: Ac12FXy_CDFzKjm4AokW8a0bG4a5ZEtQ-LJTabWie8Pk2p6JfFDWqEKdOo_LGZg
Message-ID: <CAA6zWZ+KE+4bMVzacVB=EYMr0YrCbFWia6Y6LgCs8GZTTuMRHA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] leds/leds-is31fl32xx: add support for is31fl3236a
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> So close!
:)

>  This should line-up with the '(.
Spacebar to the rescue it is then.

