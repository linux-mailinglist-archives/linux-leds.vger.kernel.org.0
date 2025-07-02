Return-Path: <linux-leds+bounces-4964-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47037AF5E5D
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 18:19:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FFC61894E17
	for <lists+linux-leds@lfdr.de>; Wed,  2 Jul 2025 16:19:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 255A319DF61;
	Wed,  2 Jul 2025 16:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWrhSGIr"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1832101DE;
	Wed,  2 Jul 2025 16:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751473153; cv=none; b=qePkbXZ6WVTUpq0bjfPgKzqjuO9T0nDux1Qia6t1UVpT2piqWj1KEfgnIO1cAIFXJsTrn4KlvmBWF+9aaJXWo8j99zZ4BSeroevgYS6v6u9f4PhvDHe82U/Uslu45+W+jWhKMreBAyVmUMd/A/hwp92E7CXvEZZEXPzsJGwD4/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751473153; c=relaxed/simple;
	bh=g/E3PVBxGQOyPGvR2wF7i79XkUmwB/psQCQcNcuvrTY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jWRxfCEEFxFMkgCjLL7CB2s32e4e8f9x8ymuOOAyXG/Hctn6dv/frbFUtMK7le2nGeGGgroXwoYqXiiUjFhTV/gqr4zAnoM6qn92bEMjQez4l4WlB0OPT5UCVOlldAg+WDR9YdtnLupi4c87+nn2TW7Q5OOOwy1WIXStsaoIeKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWrhSGIr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A6C4C4CEE7;
	Wed,  2 Jul 2025 16:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751473152;
	bh=g/E3PVBxGQOyPGvR2wF7i79XkUmwB/psQCQcNcuvrTY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eWrhSGIr0GvlLhGoHvBbri+pRnWi16Mg0e8Rk8pL1ovhVRcnh/tXJOgueL6s4YuYA
	 lHPr03GVUfDSOnCn/FfztFM86KmBZoFuijaU5wDAycb8XOeLqxKkrpI1NE9BkmbrSg
	 8F+gbMh/SHgTP4mZ+vGqkP9JC/yUXWw+SIlym4sG+Mri2ATka8YrIdM2YrkZRQz2ZF
	 EzUczzvwoREYJJ9JYkyDcsZem3TXlOF7Sep3vQPHjuH4QhjHl0aSwJo1/EQkeGcwKO
	 /yaUalvKoroH8I4xVxTXfYO2DWVoignFcHuPINRbIuqQ0610sVGapUaYwNEERFj23s
	 G2A/OtctBzAhA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Eddie James <eajames@linux.ibm.com>, 
 linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pavel Machek <pavel@kernel.org>, kernel test robot <lkp@intel.com>
In-Reply-To: <20250630093906.1715800-1-andriy.shevchenko@linux.intel.com>
References: <20250630093906.1715800-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 1/1] leds: pca955x: Avoid potential
 overflow when filling default_label (take 2)
Message-Id: <175147315099.3074723.1901469504534870629.b4-ty@kernel.org>
Date: Wed, 02 Jul 2025 17:19:10 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Mon, 30 Jun 2025 12:39:06 +0300, Andy Shevchenko wrote:
> GCC compiler v8.5.0 is not happy about printing
> into a too short buffer (when build with `make W=1`):
> 
>   drivers/leds/leds-pca955x.c:696:5: note: 'snprintf' output between 2 and 11 bytes into a destination of size 8
> 
> Unfortunately this is a false positive from the old GCC versions,
> but we may still improve the code by using '%hhu' format specifier
> and reduce buffer size by 4 bytes.
> 
> [...]

Applied, thanks!

[1/1] leds: pca955x: Avoid potential overflow when filling default_label (take 2)
      commit: 239afba8b9f3b0fcfd464d5ffeaed0ed4441c5a4

--
Lee Jones [李琼斯]


