Return-Path: <linux-leds+bounces-4451-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 71B38A83F72
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 11:53:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A09CD189CF8C
	for <lists+linux-leds@lfdr.de>; Thu, 10 Apr 2025 09:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A21921D587;
	Thu, 10 Apr 2025 09:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O0BOYIrs"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 567501AA1FF
	for <linux-leds@vger.kernel.org>; Thu, 10 Apr 2025 09:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744278787; cv=none; b=ZFuEAkyCtOrWdsDHhAwZcJiSUOtEBJd5pPBBJ8RsJYhCFIfUCKw3g6/N73HG+iBM6h1eucNryOc1c1F+l5MeZGn0w85aB7Be+1TNLOy4QhEkHpah2I+U2pVuDxalTSExvIJmRbUecyMbgZKT0rXAwlMJN23u01kMv5t7jKHNCrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744278787; c=relaxed/simple;
	bh=BFB7fX1NaWobtFIt0mBhU6ufk6qWce+YRsnk2FA9Hog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=T43iuK9y4o0HgdFXsHhuLijH8D7iwUVj6zMl9P0aATtNgQREQCKe9abjXaEnRPQFdU6wjmbju23rRW+1TnIvlFu5NASXTNMYe4ObvozExb2AxTDa2834ZPTBYq1CqyvJJgLqtMwre3wRD7g/vrihz1mLsfZTyeI5q90AmhpR1vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O0BOYIrs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54FFC4CEDD;
	Thu, 10 Apr 2025 09:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744278786;
	bh=BFB7fX1NaWobtFIt0mBhU6ufk6qWce+YRsnk2FA9Hog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=O0BOYIrsMjnUNIsTbxkdCnC8kIy+/KeleeKsfzHjMjrmQklwp3+MWHfj4lqnMriX6
	 G4FX10hvxyPrwgDKXBHAe3LqIHf8gRvTjPRADFfMENX1HSvgBo6zxlXn5cFTgeo5iK
	 70z/3OuHheQFtGceXITH2+vKa8AxLecMmzZXrhkZy48afVMzXd1k5M33qNx03BW9N7
	 3AIWBOso9YoxHprd8hxuN5fPPalk3jQ2fwJXVf8bBQ04GKePr/dS/ImIBQj0f8jw2j
	 St8xJo7JJfk81QAF8i/hZVKRg2Tw8c+o1ExBpXUi8QUTYOQQpQJijA38KDe+wbKFJp
	 c5TSJF3EF402Q==
From: Lee Jones <lee@kernel.org>
To: linux-leds@vger.kernel.org, lee@kernel.org, 
 Sven Schwermer <sven@svenschwermer.de>
Cc: Sven Schwermer <sven.schwermer@disruptive-technologies.com>, 
 jacek.anaszewski@gmail.com, schuchmann@schleissheimer.de, pavel@ucw.cz
In-Reply-To: <20250404184043.227116-1-sven@svenschwermer.de>
References: <20250404154621.GI372032@google.com>
 <20250404184043.227116-1-sven@svenschwermer.de>
Subject: Re: (subset) [PATCH v3] led: multicolor: Fix intensity setting
 while SW blinking
Message-Id: <174427878439.1693154.16822272837665051015.b4-ty@kernel.org>
Date: Thu, 10 Apr 2025 10:53:04 +0100
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Fri, 04 Apr 2025 20:40:36 +0200, Sven Schwermer wrote:
> When writing to the multi_intensity file, don't unconditionally call
> led_set_brightness. By only doing this if blinking is inactive we
> prevent blinking from stopping if the blinking is in its off phase while
> the file is written.
> 
> Instead, if blinking is active, the changed intensity values are applied
> upon the next blink. This is consistent with changing the brightness on
> monochrome LEDs with active blinking.
> 
> [...]

Applied, thanks!

[1/1] led: multicolor: Fix intensity setting while SW blinking
      commit: 0b923d52bd15008d5a0e7b0f82e06db10a868d98

--
Lee Jones [李琼斯]


