Return-Path: <linux-leds+bounces-3598-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE139F1251
	for <lists+linux-leds@lfdr.de>; Fri, 13 Dec 2024 17:36:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B22816BE5B
	for <lists+linux-leds@lfdr.de>; Fri, 13 Dec 2024 16:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7385816D9DF;
	Fri, 13 Dec 2024 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XGomBkdf"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A06F152E1C;
	Fri, 13 Dec 2024 16:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734107690; cv=none; b=bIERiJpZkple5X/o+mnzMJbr5ZDWW2Ex5M50KO5XbEkumIeT0J4fXIvf6ZzkoJ5wUzZCDsovzSqY3Yy2WivfYG59IxjmpIXiYEqdY2tuezzSNF5cTcxXh4XQBto8kCIk1pS38omFAOyhQFoXJ9SXlraDpj0Zz7Q4f82m4ZHxxh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734107690; c=relaxed/simple;
	bh=h5uR+V6aT4xqNDEvXbYnQpD1uS9tYIfFD+uu9x2KuVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ToY30mWgdsn4g8Bi5fopCozeT9tq47wzy8KLk3JzQh/ksT4V0gqwPHzXb2zRyXzusALt5rHbFJqJ09rJN2z900Tzvkd9Wi2n1mAj8g8gfUZBognGtF7PynRHrvyc7f32YqiR3+ZI0MJCc2tsRae7KPWMIlD2oET3nwzwFm/5XRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XGomBkdf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81806C4CED0;
	Fri, 13 Dec 2024 16:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734107689;
	bh=h5uR+V6aT4xqNDEvXbYnQpD1uS9tYIfFD+uu9x2KuVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XGomBkdfvZXMMPftkqYJAhvB1Fut8BPCwtzKETtQVXHozuT8nFL44emXukMlYqOiK
	 DOW5F0WQoAZjzRdCaN6X/Jil6fjOB95Xwt7Fm+8Q2qUjyRzoOiDxX1Uhq5T66xHBJc
	 gIdphaCNSmdDrYt7jaZ5rgSAaJupymPERC0PC09a+nlln+wIKgiOIJfvlTqFfEzwz1
	 wRM3HTj4E0BOihEvJC4K3G2B7rj1VQneL8ToEd/v7zCwRf0sBFibPxdQON+Pl9SbRz
	 9XMtvl4w8P4kUoEJv9PgLWRBoAfazU3/f9cDf8ueItqGVYkMqxksPmQKO2RyYgYE02
	 BlYh0Wo7cfV5A==
Date: Fri, 13 Dec 2024 16:34:45 +0000
From: Lee Jones <lee@kernel.org>
To: Jakob Riepler <jakob.riepler@chaosfield.at>
Cc: Jakob Riepler <jakob+lkml@chaosfield.at>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v2] leds: pwm-multicolor: Disable PWM when going to
 suspend
Message-ID: <20241213163445.GA2418536@google.com>
References: <d7d930bc-4c82-4272-b2c6-88f7cac5a3e1@chaosfield.at>
 <50bbd767-b0e0-4788-975b-f5d9598208e5@chaosfield.at>
 <20241212174356.GJ7139@google.com>
 <d021d011-d5d4-4692-973a-f5a45be8db94@chaosfield.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d021d011-d5d4-4692-973a-f5a45be8db94@chaosfield.at>

On Fri, 13 Dec 2024, Jakob Riepler wrote:

> > I get a warning that this patch is corrupt as well.
> > 
> > How are you creating them?
> 
> `git format-patch` and thunderbird with the settings mentioned in the kernel
> documentation.
> 
> > Please use `git format-patch`, `git send-email` or `b4`.
> 
> If you'd like I can resend with a different mail server - I had trouble
> setting up `git send-email` with my primary mail provider (enforced oauth)

I haven't tried it for sending patches, but I hear b4 is good.

I can't take what you have sent here - it doesn't apply.

-- 
Lee Jones [李琼斯]

