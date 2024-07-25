Return-Path: <linux-leds+bounces-2311-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5A393BE4E
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 11:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8FE551C2135F
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jul 2024 09:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA73B185E5D;
	Thu, 25 Jul 2024 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AvBbFaTK"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15A21CD2D;
	Thu, 25 Jul 2024 09:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721898185; cv=none; b=KOdApUmnipRK/JaMtYQd4ZsmkvOBMvUvdDOOAa1awv8Ad1ksXEE2SYeDL5NlLeB1p+cfX415ZAIYTHIYjaVRftD64Be62rtip7ypEhGL4YnkhhowN0Ntb1laWlRc7da+/cCi+jgG9I4j/C4a2BblkvCqrh+HtBgsFuZZfYhg+Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721898185; c=relaxed/simple;
	bh=ZzHc/Ddks6Fo7MVMRDjgYwrqohmmTYwTdrVpDcYj3H4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qsqegt+dk0gt34SQPV3OM3mNBSLG8/YIH3lk1ICI+rNCWymQ1FTK1Me7oYoJ612AbZ7pbmL4PF5zxSRuER3HpJZe1Mkz0gGWhWDjfszEqUkRvN0df6fsgyhnDnOVhrd3f+xmRAl4SlJvBGGxmxQWbh28v5GWmvqHXsesBEVx+Iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AvBbFaTK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2870C116B1;
	Thu, 25 Jul 2024 09:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721898185;
	bh=ZzHc/Ddks6Fo7MVMRDjgYwrqohmmTYwTdrVpDcYj3H4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AvBbFaTKUPbAyebTgARQ502MBirdmqhiKrge26bDqVyC4eiMoKuwQ4euMBiAq+iI7
	 B5PcxYXQKDlctCsGskaS+zeVHx4Oeyt6+Lmxf58LLaYgo5PeBDattnT9JWnXidtBsY
	 gVocnxd9g7pnz2zuZBI0AMWGWZI4CIJcKJh3YmTcBfumb7Z/VJG84ziezOq9WazWrJ
	 dwrTTGsX0uaFnWv/i3GQ4XPGEh+eAUgGVVwyyyI8I/0s1RQpEoOze/BoPlfkfkrlf9
	 M7DnWl42rUaDT50X60bDr9T7mYNACgWEqsc1Ij4JVhHZLnEBLfYJYVEj5qsz9ux/Km
	 Yuw5vQLMXbHIw==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org, Joseph Strauss <jstrauss@mailbox.org>
Cc: pavel@ucw.cz, jansimon.moeller@gmx.de, conor@kernel.org, 
 christophe.jaillet@wanadoo.fr, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240710184844.108006-1-jstrauss@mailbox.org>
References: <20240710184844.108006-1-jstrauss@mailbox.org>
Subject: Re: (subset) [PATCH v8] Add multicolor support to BlinkM LED
 driver
Message-Id: <172189818354.879861.6111589122618262200.b4-ty@kernel.org>
Date: Thu, 25 Jul 2024 10:03:03 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0

On Wed, 10 Jul 2024 13:48:44 -0500, Joseph Strauss wrote:
> Add multicolor support to the BlinkM driver, making it easier to control
> from userspace. The BlinkM LED is a programmable RGB LED. The driver
> currently supports only the regular LED sysfs class, resulting in the
> creation of three distinct classes, one for red, green, and blue. The
> user then has to input three values into the three seperate brightness
> files within those classes. The multicolor LED framework makes the
> device easier to control with the multi_intensity file: the user can
> input three values at once to form a color, while still controlling the
> lightness with the brightness file.
> 
> [...]

Applied, thanks!

[1/1] Add multicolor support to BlinkM LED driver
      commit: 9adee4c2da559b22ae5448444d1d29c2d5f10df1

--
Lee Jones [李琼斯]


