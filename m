Return-Path: <linux-leds+bounces-1984-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8504590AD11
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 13:35:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28F54281385
	for <lists+linux-leds@lfdr.de>; Mon, 17 Jun 2024 11:35:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E526194AD3;
	Mon, 17 Jun 2024 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="EgmUKSMl"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06E0191461;
	Mon, 17 Jun 2024 11:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718624135; cv=none; b=mseqWyiOCD/Q7IQIXQ/H3bSxpX4ajf8Eqo85j0ZBaKauQh6dh9GqHbdR6TsPmebECp8k+KqyOR0n5Aq34DYHKYiue+8qWLRXe/pGfBUMFD12s2xpzy3HhJg4Vv8R6EOIy3pFMmbbCzH2CXTgfyKq0OsxtfMChV+gz+PG5TdC938=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718624135; c=relaxed/simple;
	bh=XxliRVqdpWsKsqcEu3t/96tFWK1GpkWqJETGL+PV4nc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m0JU8WnixFmls3n9oYBuTmkvztI9k3cBdNC9DXnd4BsmvBVYbn3mtFQE3cyOAgWwY4cIK4jrbdQPAWkG5IAl8RYIWxT3pUoNkggNBzn1UfFHhP1wQAQgh9yL8U/r8CGjtqCCfZQIjZm7KKZbUcqA1GNewQoZ6GNhh2jVOqxrKnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=EgmUKSMl; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718624099; x=1719228899; i=markus.elfring@web.de;
	bh=XxliRVqdpWsKsqcEu3t/96tFWK1GpkWqJETGL+PV4nc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=EgmUKSMlpamrvnKIHEWFIOChO9V3zg3bFL17/I0VIZy2SQqHwf22ACzybQG6/coz
	 DuWoO7nnPdhx2tfviapjmCsvtLeBeMbO6iKg7p7PRvsPuX0S0mXgdMw6KojEFNuaM
	 9ojeq3wcFKgNIhxSRrnQeJRy77u4GiarVqCPnq1eXlNd3UC+7sQnxlwcLIlwov68o
	 NCF9lEUjRI714mJ21j/3hPf/3wsfOHGxyTeXlvoxlbil567R/q2p9/LhbXIReXCTZ
	 efL3ctTcY6BvKdFRrsFxH0ztyVtT0wj0FT9C7BzH4jANn9onze9zY+H8PMAD3hvTy
	 XACrDO9kCCnSfIG3hg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1M59jC-1sKGZD1XhU-00GfTD; Mon, 17
 Jun 2024 13:34:59 +0200
Message-ID: <cc44d8e8-a7fc-48d2-a497-956dde22ff46@web.de>
Date: Mon, 17 Jun 2024 13:34:57 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v4 2/3] leds: sy7802: Add support for Silergy SY7802 flash LED
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Pavel Machek <pavel@ucw.cz>, =?UTF-8?Q?Andr=C3=A9_Apitzsch?=
 <git@apitzsch.eu>, linux-leds@vger.kernel.org, phone-devel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, Bjorn Andersson <andersson@kernel.org>
Cc: Christophe Jaillet <christophe.jaillet@wanadoo.fr>,
 Conor Dooley <conor+dt@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>
References: <20240616-sy7802-v4-2-789994180e05@apitzsch.eu>
 <5701d3e7-f67b-4189-a5fd-8a992b9155fb@web.de> <ZnAHsRn3N4mwPL7q@duo.ucw.cz>
 <e9fd75aa-3bd8-4227-ac07-fc762e558ea6@web.de>
 <nxrodsfowjfn64dn6idoi56hzrhdszxylmw6kdhgxbt53akamf@aavvblj64syf>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <nxrodsfowjfn64dn6idoi56hzrhdszxylmw6kdhgxbt53akamf@aavvblj64syf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jsuSdlwXKRSHY2XfCETjDQgmpLkmqyIzK7uZQAfoSU6PSrXsyD7
 ZStOs2kQKAx19AgYuXCuvRLVJVDT3QvV6vPY6cqeH3HLFsCUloHBOw2mhuQd4DMku2tLwzf
 qgyQyL3yAmmgZK3+hM4avQxih240BvmGLs59Q/O3+/TXITUzCU6wAB2IYVKWE3p+hQavC6M
 bO6xPXQp65lPVH9ZcIivQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:dLTQFaCvbF8=;P4D+4gPaH91H11DXfXST39sHCtE
 jYs3aV0U8NRlz9CF1fdHOksVa6wtSpnwpVK66dEq7ou4lM2Tjq+1VTy75DdJCxiAgDJxTOXtw
 6mbhPGMTl8AJHbCFayNzMC4SWqyam9rbWbbTn3ACqG/44Ec26BZfC2vkS1mReRTSjTuI+xH6b
 ZsH2FSKLzGAyNyLzqc7gxmwpQHgLNLvFaimR0vuUuJNSU+FAyeryFJFl5gkoEUomEXwgY1SwV
 /3Gbo3DVsd04khhqzqrg7l9Pqkae7ynQDpbU3S9ovm9siL9UiMTd1l3R/5naApAAvS59vd1Fd
 RLT2g1uTkajDx7AMwYMhyIT0GMx6SAXtLc9IhpKjJsrPep3J3fehNZPpOwRvmqKy+D/gJ9j5Z
 xc0NpIcOul0RkO8zH7o6v9WVDhBOZryYggdVUcgo3Hz98oSyRo0HzUCwCEGnFA9jvGyORbxLZ
 agp8xZBxVElvUavd/VoMw2o2GlzQq78BIUyviGB4OxPpKo5uIK8buLO9IM8R3EqIi1vB02a2c
 9p5t2cdT6LblKwYNZpTL+0EsGeP6v/gsuZ4HDoJf6O3Kg4D1aA8y0FreiI/Se8Pm5Nkt94khu
 3mCX2GvfppT7aZCq9ZqRU3UwKay4imb2i2rT/BK1nediA7cVlr1l2k22j++XZr9n6hWxw5qfD
 HNhW0F0o/ScPw+VmcFp5MgducJADb3NT7D0AoEvIYo2x6WUbNrbOH9KQ4cw+sg1HXoU9R2LUO
 UkBbREsE0nempk7AwBxIqISoLbhm9VZzaYNBZ2ob7wO/L7LDOl1BSieb+zACki4gOBb0NdEZx
 WYJ8F2OJPlXeFema846yhE0zpD784JGFtxJJKs0CMA7dU=

>> Various source code places can be updated also according to referenced
>> programming interfaces.
>> https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/cleanup=
.h#L8
>>
>> Will corresponding collateral evolution become better supported?
>
> Plesae stop this. cleanup.h might be a nice thing, but it should not be
> used to make code less obvious or worse.

These APIs were added to improve several software components,
weren't they?

Regards,
Markus

