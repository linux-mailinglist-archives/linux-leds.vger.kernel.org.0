Return-Path: <linux-leds+bounces-458-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2D381B9A6
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 15:36:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7CE741F22912
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 14:36:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA091E526;
	Thu, 21 Dec 2023 14:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQbVHI8/"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A0A1DFEC;
	Thu, 21 Dec 2023 14:36:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10EF0C433C7;
	Thu, 21 Dec 2023 14:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703169402;
	bh=AZyqwaYUKfyV/mZbLIw8EYrc0hzX49nYa5z9eCGjRC8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=nQbVHI8/WptFKUoeBoF5T3Yxfb+cs8pUUqXy4z+x8KtaaTHkfwNTnuRcrzWHrrq22
	 /4M5weCRkHm03W68TB0+Mrt2/f8c3Ln54BKDxRoJ3p2N4U80k00T0TgVPYdbpr7T1V
	 i/cLd3vcBLZYGFbb0V8qA4K7r68kKlAY+h9jmNcRa6lZ6feNTgQjF4wBcvwXEXG406
	 qy/bsgbEXHF528KnH2MZBOHYJ9r81r1/CMjG+UhdXhA/dl7tJuP/KyEwXH7lnBerVQ
	 5ndvll8XbiUfpXRo9JzMXu6/ejwttk8FMht4k6F71PfRKhWPDaL6gMXAAQK94ubwZr
	 TzYjUCfLw690A==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Jean Delvare <jdelvare@suse.de>
Cc: linux-leds@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
In-Reply-To: <20231202214353.7c02f23c@endymion.delvare>
References: <20231202214353.7c02f23c@endymion.delvare>
Subject: Re: (subset) [PATCH] leds: rgb: Drop obsolete dependency on
 COMPILE_TEST
Message-Id: <170316940074.596747.4327963785892593985.b4-ty@kernel.org>
Date: Thu, 21 Dec 2023 14:36:40 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Sat, 02 Dec 2023 21:43:53 +0100, Jean Delvare wrote:
> Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> is possible to test-build any driver which depends on OF on any
> architecture by explicitly selecting OF. Therefore depending on
> COMPILE_TEST as an alternative is no longer needed.
> 
> 

Applied, thanks!

[1/1] leds: rgb: Drop obsolete dependency on COMPILE_TEST
      commit: 5e72f1fe23839bd2093693a357a6fac8e5463483

--
Lee Jones [李琼斯]


