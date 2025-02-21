Return-Path: <linux-leds+bounces-4052-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 821DBA3FB3F
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2025 17:29:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBBF2881212
	for <lists+linux-leds@lfdr.de>; Fri, 21 Feb 2025 16:19:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96DE921578A;
	Fri, 21 Feb 2025 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GnuvIHuN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728F12153F4
	for <linux-leds@vger.kernel.org>; Fri, 21 Feb 2025 16:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740154487; cv=none; b=rNtK71udlE/A6BzsfI/Isexzfnul7erSYtK8otqkZlgrt2xGWZ+33JmxgFqnf/cnY1SPiTIH+5leOXivaSI/D3Pu40hxQqwI5M6FtiblhadSD9VHG20qPjrzJnC9ZVr6nruJNoCwi6smJOFt4WDUvKpJGM1ot2gkX9kYRIS6xN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740154487; c=relaxed/simple;
	bh=6edvXwpZXen78ExTo1ff+F30/hPIQs0CepzBGs1sJEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=dyJ11Sb3fBjpQOer2XcCVAUlssuv3GLoDA0WtJ5ZNtjmF3aabK6E4wpcmk7FSUQSNi/6yX5dGkxh8ZBpFHNURDI2HLEnmNYgekVu3GYVQJxrFDn8GwA9A1yalnyl7uytFRKxVOZj1zPQP53UX0wV4fYkkp8B8OWuZNIpMs8pFNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GnuvIHuN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB916C4CED6;
	Fri, 21 Feb 2025 16:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740154487;
	bh=6edvXwpZXen78ExTo1ff+F30/hPIQs0CepzBGs1sJEk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=GnuvIHuNSUj0Dj02mESMKRPoXqE8/+M4HtFZgeHd+BP/X0c8/OTeRdvegy2LneNR1
	 /IIWRPZxPMc6dR4UuD7Z+2ofA70cXmmuE+83aXO+Lq5/40FGP6jTLzs8gMo08ALl/C
	 soP+0hRhhKmmzTUw9j5GO9VPoYf1ZVVcQ3k2tvEt3v4INOZOx/wP7Ir3jVvcgyh4EO
	 D0bryh8YOpCHWZ3ZNlI74ZuFO2cNMP5qM/3RZYsKy1MfJzyw292pfbzUG5LhlA0IWU
	 5sKXtRPe9tCJ+LRhiTA3mlFYVvEqj2sixAd0PyQTZG/xv5J160oaWyOPEeCNf2nqYM
	 1bkxuJY6vBdYQ==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, Eddie James <eajames@linux.ibm.com>
Cc: lee@kernel.org, pavel@ucw.cz, jiapeng.chong@linux.alibaba.com
In-Reply-To: <20250221155144.2109806-1-eajames@linux.ibm.com>
References: <20250221155144.2109806-1-eajames@linux.ibm.com>
Subject: Re: (subset) [PATCH] Revert "leds-pca955x: Remove the unused
 function pca95xx_num_led_regs()"
Message-Id: <174015448570.1307119.13286089635948958123.b4-ty@kernel.org>
Date: Fri, 21 Feb 2025 16:14:45 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Fri, 21 Feb 2025 09:51:44 -0600, Eddie James wrote:
> This reverts commit 38bcb51f81af17a6d40fc135e565fc1fb8aa8e9d. This
> function is needed by the hardware blink support just introduced. Also
> rename the function to pca955x_num_led_regs to match the rest of the
> functions in the driver.
> 
> 

Applied, thanks!

[1/1] Revert "leds-pca955x: Remove the unused function pca95xx_num_led_regs()"
      commit: 012825dbd5aa7454b93f7a17bd99efee114023ba

--
Lee Jones [李琼斯]


