Return-Path: <linux-leds+bounces-2164-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 196D191A12B
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 10:12:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97636B223F3
	for <lists+linux-leds@lfdr.de>; Thu, 27 Jun 2024 08:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E1325FEE6;
	Thu, 27 Jun 2024 08:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="qJEiRhyd"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.17.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3919623BE;
	Thu, 27 Jun 2024 08:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719475955; cv=none; b=QWr0Bg1y6+q1d17zl+PweN4qCQLmOxAE/gdxLFgDHqJnz0e0XvtR6E3Zf8gwJ/Bl4BhkcLY31BXVoa/NK7QMXwNa4pgTr5AsnpnaUrpA5g2yiKboAysbwCxtxVqaCpLb0ruaJaABsyMkFpLTk+l1rugr83A3AFlhIG6WrIOMxNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719475955; c=relaxed/simple;
	bh=fiWrayC4CoOBwPtIsiSX/GiXceLl+OaC2dxB0IutO90=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Rx+ip1ClN/Qnybt/Dk/c1qQrfuv88g4AGteKbSaPViBGpv8EjjjsQORO+I6PKT4vZ+6mq4sPe6qRnxzQ30h1yv8GTAoUS3oLE0GIiOJTgzRBa87TD+I68pm4qAnxXgGIC3TZyyKKpXM6jElGes4sTLzOdlJWcDZcGAw7Nu7QnE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=qJEiRhyd; arc=none smtp.client-ip=212.227.17.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1719475931; x=1720080731; i=markus.elfring@web.de;
	bh=mhQVKH8+Px7f5Ojk/E2nBPFB2qgO/2wkwUsc6zhbtbI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=qJEiRhydvspISLCC70vtzLqcsU8FELDUUbYITGxm1V+F6sFgE4w3e7iovaQx3iFy
	 T8vugz9+wzb+YcPbBZNDr1FW7XE8Py8Bv0aI0y96JxlBm5qCBI0JLdSkiO1A/h1kr
	 3tcoXw48d+/0AYwfIusuFun0rpu47bHe3DnmyCbrTjBrVeS4cKAd4xZ63fRJT1Q6X
	 7PZrSotrVzCrgPSqj/nKFkNJsK8HI7+VFVHabhmg+UtlnpnIBM5ptVCKaK8vttTGk
	 J7rjK1TAzfktyk0ZxCPpLT7OUFZ7KscWG471tqm2WPpdrhWwK3Z9DI6MnwQedqUgu
	 GdA4UCFfJAMU2aextQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.91.95]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MZSFY-1rrTZt0Sne-00QMKG; Thu, 27
 Jun 2024 10:12:11 +0200
Message-ID: <873c2900-859d-40eb-97df-f45f714ed295@web.de>
Date: Thu, 27 Jun 2024 10:12:10 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [3/3] leds: leds-lp55xx: Convert mutex lock/unlock to guard API
To: Lee Jones <lee@kernel.org>, linux-leds@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Julia Lawall <julia.lawall@inria.fr>, Pavel Machek <pavel@ucw.cz>
References: <20240626221520.2846-1-ansuelsmth@gmail.com>
 <20240626221520.2846-3-ansuelsmth@gmail.com>
 <fa53fa80-4c0e-44d1-a62d-da219831526c@web.de>
 <20240627070909.GD2532839@google.com>
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240627070909.GD2532839@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:sfP02OlOEek9hLSqJ6tuRgykIOaf//tZu58IwVFIWt2LpAO5ncp
 37rN0Fka8KsjMZe+RW7gndekYZzWjntiACX06qUKyoSsaj0AOWbv2clzcT8NcXxaO3oHiVP
 3xLob7OyBV2CItJNtSytAys9u4iMUY2c/bomaVWBsu3ePWULT+YPO6dnOmmFcMV/XpFopgC
 B8MDlm+U2ravKQiPzDmgA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:vY4+w2lbiss=;8dCvRqr/bDnowWIHTdRnxTJNXGj
 IrFxtZlxC4C3H28Db53PjrcBI+23H6MC919MshCPNLYugTEgC36FQJLD1rhoMrzV+bVVfUis1
 db95qXS4rsxJFwsRC4VTjTOC8lFfv9dv1xPbMARbaQL6XXOee0OI1u4T3F7xARGsKnHQbGaAF
 xmx3Yual9aXLUsA4Y82RJlNSBT0S6xzVIbkz3veEPclBqDx9g+7Hcm59zOgKeu9uOBJvQAf/O
 OWbI3/u6OB2ojqrAGvyaFDdRBkfo3NpRdqrdLMrf0mwHZj0bkhVeIMmVXvULHNYcrKWBDI4fB
 BhDY7xV4rwldgLEWtU0wP29ZftWmYdqtz53e1dn9KRzZ/dZ8VoUCAdnrEHmTUNAh7nNSN06j/
 0t6kAmAC8FoPNerFyZDVExFhKRx+ndpc17GpkQebI/sL0xpRBfVmpXHesQYBh2b9yguZ0gqsV
 BGBEDq3yOLk8LR7wn2N5OYRk8WinLkHiNfhr/O78U6UhrQrLEnLI1ICHXAuYvXicwCxgq/rn5
 di2UPMqSeddrW/8hFrQOFvPFG4Tcb2cMYmEirt22uMhCPgOe7032QOO0CfNATNeW6qu+23VZ8
 lznBTJY5aora8epYDJx/SjcYGU7g6yFwdgyYchrZC/WEJ0oF0vdq/1b+TzqxcSntgLq3BbYhJ
 fTVbAVginTMO8b3alA8vYkBmp8z6lSXg+WbChPTogJncSv3AnJ+AiCgymmqdFlsJLBt0dyelc
 3X9+PfVq+mOfCeQ89jKe8Du77JC2IcOTIAqOaFaMP/fBRXAaCmPtXUu+n/wSSVyCx+BtYcaqN
 g5V244yPBOUl0w6wms7Xp7VVF9DoJVfDqhAR7FSqsKOQY=

>>> Convert any entry of mutex lock/unlock to guard API and simplify code.
>>
>> Thanks that you would like to support another bit of collateral evoluti=
on.
>>
>> * Would you get into the mood to benefit any more from applications
>>   of scope-based resource management?
>
> Why don't you submit them yourself instead of asking others to do work?

1. The change resistance (or acceptance) is varying for possible software =
transformations
   in wide ranges, isn't it?


2. I would appreciate better support and collaboration with additional dev=
elopment resources.


3. I hope that further improvements can be achieved also by the means of
   the semantic patch language (Coccinelle software) in safer and more con=
venient ways.
   Are you looking for any extensions according to the coccicheck tool?


Regards,
Markus

