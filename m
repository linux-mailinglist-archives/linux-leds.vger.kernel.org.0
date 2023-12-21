Return-Path: <linux-leds+bounces-461-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFF781B9ED
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 15:55:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1F5B1F235DB
	for <lists+linux-leds@lfdr.de>; Thu, 21 Dec 2023 14:55:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89BFE3609E;
	Thu, 21 Dec 2023 14:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y7eSVn0e"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7063C6D6D7
	for <linux-leds@vger.kernel.org>; Thu, 21 Dec 2023 14:55:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0843AC433C8;
	Thu, 21 Dec 2023 14:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703170510;
	bh=kUZj3JtHZlOCTE0DqJ6Ixe6JKHh21okwxqFFhIcu7oE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Y7eSVn0eMPMRXHeRWq/U6OgRDRRl7+88ij0KL5bDqQyL04oawQgRlHbERP3ScDNPY
	 jbB+psWOQkO7LBxppISfrHddZLC17HhU00xjRHnga/aYwIIUHC5ex/SkwhuFrPZeoA
	 iy0t2JO4BctfvVG5TRqc37N9k02OFik/48FoxGo0tj8aWNdJQ3RdI0R17jxwsPVbnr
	 lIeLoG0QBLE03FHfkvFygYAGKXulY53F5YOdERgU9WH2ZEgvn/RH5yTrjET/qyyyGy
	 mv4Lyk6qlDmTP3eFaW4D0H766M6ul7BG8mmlwpwU+RinmfI0uXgVhYPo/6k1EA/Gh+
	 PvLhC7J/MZNww==
From: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-leds@vger.kernel.org
In-Reply-To: <8a61e229-5388-46c7-919a-4d18cc7362b2@gmail.com>
References: <8a61e229-5388-46c7-919a-4d18cc7362b2@gmail.com>
Subject: Re: (subset) [PATCH v2] leds: trigger: panic: don't register panic
 notifier if creating the trigger failed
Message-Id: <170317050976.608371.18354133627314971665.b4-ty@kernel.org>
Date: Thu, 21 Dec 2023 14:55:09 +0000
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.12.3

On Sat, 16 Dec 2023 21:05:33 +0100, Heiner Kallweit wrote:
> It doesn't make sense to register the panic notifier if creating the
> panic trigger failed.
> 
> 

Applied, thanks!

[1/1] leds: trigger: panic: don't register panic notifier if creating the trigger failed
      commit: afacb21834bb02785ddb0c3ec197208803b74faa

--
Lee Jones [李琼斯]


