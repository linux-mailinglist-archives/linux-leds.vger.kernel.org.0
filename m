Return-Path: <linux-leds+bounces-4790-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57993AD6CFE
	for <lists+linux-leds@lfdr.de>; Thu, 12 Jun 2025 12:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 168817A33D2
	for <lists+linux-leds@lfdr.de>; Thu, 12 Jun 2025 10:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F16E22B8D0;
	Thu, 12 Jun 2025 10:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ejseiSCu"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDA01940A2;
	Thu, 12 Jun 2025 10:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749722612; cv=none; b=WHN/Oc5S17OLMDhBWo4VFtWhruU1V7hryK0+1wvNuq4jvELt3K/aDJYZeVG6RYSN58UzyshnFA0udES+O7QPbGo9C8SiXg+mN+NeM4kurL4W3asO2+uqDRQ/UD4kyjru7U2NuR5HdA5zcI/0OvU0E4pLUzshJxo9O1sKSNQ6X50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749722612; c=relaxed/simple;
	bh=3bOHFMC08twTo1dyOxaalfd3JSolq9qUYIOgHXto2os=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W3pH/DdhgDM5zANVLupQRgE7nldubiU0t7UIiO2SeJ/M7i+lR+w2U0h8KYiUSwW8yGCtpGil08jj56Y87Y4n/f6CstlIDXcz0HYdnht3PJOud5VicU9qykDmrGPPiLR5p8vFAQG4QOaTVXvpuwdh4Bjpp8vM7a4MBJihztpNA4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ejseiSCu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD028C4CEEA;
	Thu, 12 Jun 2025 10:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749722610;
	bh=3bOHFMC08twTo1dyOxaalfd3JSolq9qUYIOgHXto2os=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ejseiSCuJuANN3NHmQprE3dUbX7zxvlDQgDVc+GA7EChOQ19eiHbBPAnEYT0YA2aT
	 F49EMApG5rhnsdTMbYHEHN8ndPOQdIBR3ASYjzzoZEooF1iI0r9xM8uOa1Zdz1I0uN
	 QSh+hQQ6+/DN8d7FIyWmWTH88KW4HMyZjMSLd+TT5IYQIfFGCF2WBZNrMTnZpe/ved
	 dONet+YuftvtJMyhlzPb/aCbV2LIjnWkmKrZsSC3+v3ddP63mPFppyh2PPbbpP3eYV
	 WNHPi1PqatTapWxXwGlf1VYZXRI7GojH6hZp7GWT50nRllQ5aD9pt+jMspnDlZ0mRT
	 zq9mYwOwluq6Q==
Date: Thu, 12 Jun 2025 11:03:25 +0100
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: pavel@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5] test
Message-ID: <20250612100325.GA381401@google.com>
References: <20250610174319.183375-1-trannamatk@gmail.com>
 <20250610174319.183375-3-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250610174319.183375-3-trannamatk@gmail.com>

On Wed, 11 Jun 2025, Nam Tran wrote:

> ---
>  drivers/leds/rgb/leds-lp5812.c | 1934 ++++++++++++++++++++++++++++++++
>  drivers/leds/rgb/leds-lp5812.h |  230 ++++
>  2 files changed, 2164 insertions(+)
>  create mode 100644 drivers/leds/rgb/leds-lp5812.c
>  create mode 100644 drivers/leds/rgb/leds-lp5812.h

Doh!

-- 
Lee Jones [李琼斯]

