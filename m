Return-Path: <linux-leds+bounces-4395-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE43CA7BCDA
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 14:44:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D58063B5CD9
	for <lists+linux-leds@lfdr.de>; Fri,  4 Apr 2025 12:44:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79C101DF993;
	Fri,  4 Apr 2025 12:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1Wffv0/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB3F1DED42;
	Fri,  4 Apr 2025 12:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743770678; cv=none; b=Y1qn9Ul8OI9SUGzSUilxaWyws6rgm0pK7wggoDoaPFnlq6ovvJFHbF8slrMaiMmDYga3DNtQemWpFOxbP7mYK/9FXGd4FVqkvC6trHGxVSdBgBVALp96occ7dg2KCmrgmg5F3omPjQ4np2mTeFw0QOjAptbPolI8sWYLJPjVsFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743770678; c=relaxed/simple;
	bh=E4e67rHgpSPgqOnHvqNCsKXjZWx98mHZFwbic7q3pQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E4/UQITSGs01Q5htZGmtui2JI6yRNSWQNuxraGwiLUKP9B62C4bKrdYAD6yorEPTXpPg6fkEK+mkBmC5gxZcAHK8HjhJZxWhAlKLuzln6fp+6f2yL6iPPBvSc/mgwa1ipYEoBT5QcyTWLat6Igm6P5EjXHQVXIzLVvmzGhEIq1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1Wffv0/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF315C4CEDD;
	Fri,  4 Apr 2025 12:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743770677;
	bh=E4e67rHgpSPgqOnHvqNCsKXjZWx98mHZFwbic7q3pQk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=S1Wffv0/7oJegElGij9WL52oMeRXNfgH7JGjlizaJv0IaNPJuEdaekwV3P0+lfz2f
	 ExKe0UysVdQkTZ5I9/lwro9LxkY/EldGn3EBiK3/m8aowhgdiYRsEkrnO1sZvKJ0oA
	 iiDvPo06P/fPJrwMSFfEL96U5hnNp6b2QesTNK/uNekkPzMHK6ROdh5vYWjtSZNI18
	 bAEecRqfZNYql+bASBMYHN8VU5JFH3drYLzkUyB0V10bqCiJ6yad9j3BW4Cicwemrf
	 Dth1ZZcUycWkTMMt+aIcdn92qkXx9xXHRyrT9PbSneVrkxrO24L3cFcxZv1nYehgcS
	 H1GWLJVtbDIrg==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Pavel Machek <pavel@kernel.org>
In-Reply-To: <20250318160524.2979982-1-andriy.shevchenko@linux.intel.com>
References: <20250318160524.2979982-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v2 1/1] leds: core: Bail out when composed
 name can't fit the buffer
Message-Id: <174377067651.311707.16521927408874362100.b4-ty@kernel.org>
Date: Fri, 04 Apr 2025 13:44:36 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Tue, 18 Mar 2025 18:04:29 +0200, Andy Shevchenko wrote:
> GCC compiler complains about snprintf() calls that may potentially cut
> the output:
> 
>  drivers/leds/led-core.c:551:78: error: ‘snprintf’ output may be truncated before the last format character [-Werror=format-truncation=]
>  drivers/leds/led-core.c:554:78: error: ‘snprintf’ output may be truncated before the last format character [-Werror=format-truncation=]
>  ...
> 
> [...]

Applied, thanks!

[1/1] leds: core: Bail out when composed name can't fit the buffer
      commit: 8f5b950b7791479db918c750e1c762b2b30435e6

--
Lee Jones [李琼斯]


