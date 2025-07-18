Return-Path: <linux-leds+bounces-5092-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1D3B09BBC
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 08:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB37D3A87F0
	for <lists+linux-leds@lfdr.de>; Fri, 18 Jul 2025 06:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5009F1FECD4;
	Fri, 18 Jul 2025 06:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b="HMgO6kY1"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D12AD4689
	for <linux-leds@vger.kernel.org>; Fri, 18 Jul 2025 06:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752821616; cv=none; b=QciTAkYNCEgaSiGA7jYcEF+eO2hBdSQfYMoAftUwyZgQS2G4APKNTtiwyAKRIKdAK7Tlu1hnxA01OvfddtfRWZQzR8OdYxlkWZuj+NTtK/ceaWNxhAKpfys2RBwhM9rmLMD9O2Y4HwSkiRh22wGOVAkQwGKl6tr3mxtZ2PyCTlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752821616; c=relaxed/simple;
	bh=ybAswk9vrSD8WcUdO7ioNsJSz4/UhNNPszfHVPjePD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V3a4nVeGxBqS21eb3NXvILrhTTQ77wnna69MZcPUrg4YDeB9ttDltuNS379UfWkHikBUSFPJMSaQngLOh58addLaXc/gynAykgzl8BESFoJ4I3gMKh/J9E4tamZy9EFI2gtKlVtfZ/0uEl83tFdIxbf5RzZdf4Tsfq8gTQ6UmRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20230601.gappssmtp.com header.i=@thegoodpenguin-co-uk.20230601.gappssmtp.com header.b=HMgO6kY1; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-70f94fe1e40so32461297b3.1
        for <linux-leds@vger.kernel.org>; Thu, 17 Jul 2025 23:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20230601.gappssmtp.com; s=20230601; t=1752821614; x=1753426414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ybAswk9vrSD8WcUdO7ioNsJSz4/UhNNPszfHVPjePD8=;
        b=HMgO6kY1CuOLjnNzL+nGkL1VOPU92B9lw1SRLQ10W2xEO+/Q88MVbhz7mHo4wW9flv
         iYQvkshSWBle+esBdrJZVJvDbdC/P7W8Jz8TcraimHMTeEzIyA3y75oVQfxdhkNf82By
         RdG0LaEf8UbU9icAulHMrU6pL4calEuKlRSitk8DZ6kpPkPp37QrjvT6rFwI8Hpcu+tb
         1XX3yXgXWIk9d1p+E9ijvuMjkUXn+0tXJqTBe5H8BwU2Hvd9uvcni5odG0EYkh5FbOb+
         O2jBwJBNTBE2AW05+Gf0+W+dnHFTq0WqUtdr4Hu6BkLouaYb5E0oW3WYJo2ZbUlUmzKL
         Sqew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752821614; x=1753426414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ybAswk9vrSD8WcUdO7ioNsJSz4/UhNNPszfHVPjePD8=;
        b=R7Bgtt3agStp+h+iAv6fsqNQXCMpr/maw9Jrc+X5HqstYEXeNgc/8p729iki5j6TTd
         Lo305qJLdn8f5U55TSLX3ofM18iEWxqeH78M6DObOp3QclzHS06oOiAFj6Fscn6Ec4Pe
         oGf/JtJX3lpPTkGjzyQidW1VT5xTxY35f3sMfcotpnrpDqMQCO2dOCnmpBDgspTIcFHy
         /bBc4GFNOo39w3Ga3T/7ajn3KJOkNw2St2+A3yKetWb3aIqVULzj/Vsm3/Z2+yvD3Xeq
         qS6Ug/b8jmpcW4m+EGJK0zxE5XrQfDdIzo0B3kEndnv0uLjDCTkkf3mkU/Qd0/ouEZJd
         22YQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+YxNCl84GH99kJdRO3dBPHIR1JmMBFdQvfp+whRwOZpNqllXFQdKsFtb8Shj/5eDalzDSed9CBrmy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5xdwc/MhkNjPruS5JUZpivwWUBNR11SZE4qISe47vKSA2N1rD
	cO1vxE76n7OPH2JxAsdAsyO/mpFHv2HGhN0QCUj5QYH6SzduAgcpA7j2eynktVF8NFVMnIzMl2O
	Chdrnb9n4qQJHii+bhwJXbzH77z4z/oYdDqt6QNk2Zg==
X-Gm-Gg: ASbGnctoZ97UONjO/4SFQvR0a4CuY+EVwUzSeUcwngPzA+PCYMg8mSGainNdoGOKPnI
	hDuF2uG0Y12xnIqGzvGxzcr8CAcE6zfN6E+ifctWV+hg4w63zQm5q55g6qKShMLp6Zpv+a7k3RV
	h1MPKfSyNiFjVLU2sqs7h3xomH/1S8p1bsVZWUs3PXfOmocJfckO/9s4fFQWT2Yx7EgvaBBSARE
	wADmFVMcxZITxRO69y9rt7PtLaY/lGmXBa7lA09BA==
X-Google-Smtp-Source: AGHT+IFvLgiDoFdyL34VARsxW+rGxmiWW9QMSci2UPUIkg/0n3HOf6tTiCSKpVsOiMnEC0d1xu5Uz8jS1p4UQRTGt6c=
X-Received: by 2002:a05:690c:6513:b0:716:5fa6:c3e0 with SMTP id
 00721157ae682-7194cf5c6e5mr39124737b3.18.1752821613946; Thu, 17 Jul 2025
 23:53:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250717-leds-is31fl3236a-v4-0-72ef946bfbc8@thegoodpenguin.co.uk>
 <20250717-leds-is31fl3236a-v4-1-72ef946bfbc8@thegoodpenguin.co.uk> <20250717193118.GA3988681-robh@kernel.org>
In-Reply-To: <20250717193118.GA3988681-robh@kernel.org>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Fri, 18 Jul 2025 07:53:22 +0100
X-Gm-Features: Ac12FXwbQ2naP0VaM-2jRM9KQR9PuTu6W0JfEaf7adOYalfSuSBdpeibbuvgG0w
Message-ID: <CAA6zWZJ8-V40qLcRbRJXaOo+mLt-v1aqUg9X39mqhJD5M2sHnA@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: leds: is31fl32xx: convert the binding
 to yaml
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, devicetree@vger.kernel.org, 
	Lucca Fachinetti <luccafachinetti@gmail.com>
Content-Type: text/plain; charset="UTF-8"

> This is already false because you haven't defined the property anywhere.
> Though this property didn't exist in the existing binding, so why are
> you adding it (the commit msg needs an explanation)?

Ah forgot to rebase - this should really be in the next patch !

