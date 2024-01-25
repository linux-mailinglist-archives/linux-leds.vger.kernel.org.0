Return-Path: <linux-leds+bounces-685-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8435783C391
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jan 2024 14:24:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 39F541F26605
	for <lists+linux-leds@lfdr.de>; Thu, 25 Jan 2024 13:24:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41EF74F89C;
	Thu, 25 Jan 2024 13:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XgMwDkxD"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1224F89A
	for <linux-leds@vger.kernel.org>; Thu, 25 Jan 2024 13:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706189048; cv=none; b=f5u550Qm00devd0PTVgqounb+eHQL6DqtpQ0ix/BeTiUuUzZ2hmbGBLG3WX/B911YtYwEGjnvN6628pxsBBQow3CEQv1EPSqFZKLpjrPL6eW/v0C41HfVLi7cnxczOJT7lZq+DfZbeW8fLDNag9zNnODBagvyyHyG27HirbUmWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706189048; c=relaxed/simple;
	bh=H8s37CCoAnEgGnnBlHRCvSS1S5vL2L4ZXWMxEAPehI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nPROwCOd7T6NUdtMszcOjx0trQ3XmErCa/9fg+uxdhG0XPWgnePez9G+4dwrMI67uDJRIYYjKN60QnoqHbsjarJt38qk41CQocbUlWZz/9AVs/X+nbBOMRN2wW8V7upzoGFRKeqnKTJHBhUL89cR9ZrKfDkH2IeKemjTWUtyfTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XgMwDkxD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD009C433F1;
	Thu, 25 Jan 2024 13:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706189047;
	bh=H8s37CCoAnEgGnnBlHRCvSS1S5vL2L4ZXWMxEAPehI0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XgMwDkxDyRitWDEJwq9yWOf9oNddkamphrDdhw1bWUXKQxUNztx9nUbSg88TM7q3k
	 MAuylnbp7DiiUDVkWs6JhOBV5tMtNu/MkfGIb72HpBne3rv2nmUryQE0PuvtFUB0by
	 UW7wOOQ7B+nzFZ8k8L0rMs4y251+04zUSMqtfevwf2Nr/flG653f+Om2xz4p0Hau8D
	 y2MbDvK197AYpgge0Hp1BtnyPfnbUMEqSdP0S/FRWogUFOqfcO92sJ3ta/q6gwLpRk
	 D996lzoxYEM6LJKAIMXGn8OVSEDd6BIhm1MIfns5svfJAmvpat+Cpdg69+YEJGR/fu
	 Z8/9Ifn4kqXag==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <7e94d26b-d772-4a07-b0f6-bb3111b9ff75@gmail.com>
References: <7e94d26b-d772-4a07-b0f6-bb3111b9ff75@gmail.com>
Subject: Re: (subset) [PATCH] leds: triggers: default-on: Add module alias
 for module auto-loading
Message-Id: <170618904649.1461067.3538576477258502350.b4-ty@kernel.org>
Date: Thu, 25 Jan 2024 13:24:06 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Mon, 15 Jan 2024 22:46:23 +0100, Heiner Kallweit wrote:
> A bigger number of board device tree files, plus few drivers, set
> default-on as default trigger for LED's. Therefore add an alias for
> module auto-loading.
> 
> 

Applied, thanks!

[1/1] leds: triggers: default-on: Add module alias for module auto-loading
      commit: 9458344867e19e3adc2a1de2ec82345ebaba8786

--
Lee Jones [李琼斯]


