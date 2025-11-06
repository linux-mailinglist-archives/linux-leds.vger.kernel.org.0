Return-Path: <linux-leds+bounces-6028-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D966C3CA1B
	for <lists+linux-leds@lfdr.de>; Thu, 06 Nov 2025 17:56:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 35AB335279A
	for <lists+linux-leds@lfdr.de>; Thu,  6 Nov 2025 16:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9480934D4D7;
	Thu,  6 Nov 2025 16:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LREOG0gn"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69BF734D4CD;
	Thu,  6 Nov 2025 16:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762448190; cv=none; b=mFH4DgVx5XPALxngptbHJNYyf6h5uGxkBFC3EAIYz5bawzaJj9omx7TsFy9af89m6IHqaHSoGv75Njuc66eSgijAzIlsNWDDTOIomkMi/+/Y2MrVYlN/Jpo1TX486lP98zRpSudTpHWptSwjcSSP65rW4huDhfblEeoZHFvkQxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762448190; c=relaxed/simple;
	bh=FuO1gz5tfoLvvbB4jOghkbbmvdkSwTkLpzNI5+ALn7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=EwlBYIxpHgw362/nUFXJrzc+DIrXvJQ2zi4q7w6MKNTeg9JZH+CssY/6CFX/cRntHpFdI+vd4QvUVgYEwsmcdboXqnj4n7dhzVowaBRLrc5mSVPJKT0PxqMaOzVeQeOIS22ePs+/qdpw83bfGMiEWXhn2mDAKO0X69i6b9fBLGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LREOG0gn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F2FCC19422;
	Thu,  6 Nov 2025 16:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762448190;
	bh=FuO1gz5tfoLvvbB4jOghkbbmvdkSwTkLpzNI5+ALn7I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=LREOG0gnnPp2NMG5Ii8znRTg3c6awZa5Yy4/HB6k4hIvsjK6ewJ4FbPr3Shp4btjB
	 eCYeCM+BEmAXoiqn+q6gvG4hUnzMbhzYi4HOahdJ340MSkhIg/ujThjzy8JgVxQ/A+
	 3Ec/OJhBjXaJcXdfjknMFi9A/qbiN4eNCujx2MwtUvgm0q5gQDNeVKFSYZIkuFW7Ps
	 qMw4MmPVFzdJmdZbVjI9/H0PM3YkS40hRIDcLw5sPGlXz4xV16heRQKTqeKzd/wNPj
	 XlS6q2VFf7sTrh1tHgTsOu3TxW612JRU283HZny69pl1Ljp/d3H7rdEL/PnuH/PpLa
	 pRvfdoZhuS5dA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org
In-Reply-To: <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>
References: <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>
Subject: Re: (subset) [PATCH 2/2] backlight: ktd2801: Depend on GPIOLIB
Message-Id: <176244818780.1958671.15088383749219735173.b4-ty@kernel.org>
Date: Thu, 06 Nov 2025 16:56:27 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Tue, 29 Jul 2025 19:18:30 +0200, Duje Mihanović wrote:
> The LEDS_EXPRESSWIRE library used by the driver requires GPIOLIB. Make
> sure this dependency is not left unsatisfied.
> 
> 

Applied, thanks!

[2/2] backlight: ktd2801: Depend on GPIOLIB
      commit: d95963e309bc1211e28051314e72638d98225614

--
Lee Jones [李琼斯]


