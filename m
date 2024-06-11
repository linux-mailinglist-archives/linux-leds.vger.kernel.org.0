Return-Path: <linux-leds+bounces-1875-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88203903E52
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 16:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 86B3F1C24F12
	for <lists+linux-leds@lfdr.de>; Tue, 11 Jun 2024 14:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E94BB17B437;
	Tue, 11 Jun 2024 14:02:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="D0Wm4Gej"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC241DFF8;
	Tue, 11 Jun 2024 14:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718114561; cv=none; b=JilrWbqaXMQ4VWrsPvYKHoYMklwefUpQ0qKoZsjwDFw/3pOCumzYua1JdkAK+HFFG+jICoTTYBQ2tvFWvriNFuepOIy0gDoo/Rtwa18fmUKk5l9ejI8NX+F0DQygU4z9itOew4RlcjSG6gCEz1vM1/TjNGd9UCvOelEjhey6g50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718114561; c=relaxed/simple;
	bh=W2pEsKL7o7jrs2TaEo52X5dgZvZI9653hgnLFvrpWSg=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=d6yH9l4wfWB65vWW1TDVQ4HaK5J1snxhK9U4gz7JVvPNL7K0ZbF6BglD1oZxIBv/8Kyfo6kqozCLZ4KqS/h3d4a3nt56580uYBScztueDw1wOtUXroDaUw2eqhhzTeCKSjFUQ58qSn0+Ewqv0JAB0DeABENZ4aZ5ZhS9hr9lVik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=D0Wm4Gej; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718114515; x=1718719315; i=markus.elfring@web.de;
	bh=W2pEsKL7o7jrs2TaEo52X5dgZvZI9653hgnLFvrpWSg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=D0Wm4Gejk6TSeDRq9+doUX7Io3ROv8ClPa713A7kmm3ChhE6Vrkx5R67ENav3jiB
	 v+HZkq7zNZW/1ui3mJlE7d9A7Jnb3rkNbaI3Ntq1vN88WwUogv6SufuERrGtwdlkO
	 2aMEyqQlHCMidj4Zpou8EXO0B+Oc5JYfaAmW5X1ugehJErJ0w3T/14bmuObjfHUKR
	 9lRAXbK2xwFDVqSXrmAuQdFMcj8+I2S1pFOsiiZKDI14AGiB1zZo9BRSARPYQ+ClF
	 MKEB/EM3bJ1ebocSbE1SgcludIdq4+tcgcq9CAVw+BBx0vSMTwubcg/aIGQKdsBmA
	 Se9tCmH10v+UbQ7qpw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MnG2C-1sihrL0iOa-00dahS; Tue, 11
 Jun 2024 16:01:55 +0200
Message-ID: <010b1c91-fbde-4b01-a92e-8c14751c7699@web.de>
Date: Tue, 11 Jun 2024 16:01:49 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 linux-leds@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Pavel Machek <pavel@ucw.cz>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
Subject: Re: [PATCH] leds: mt6360: fix memory leak in
 mt6360_init_isnk_properties()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240611-leds-mt6360-memleak-v1-1-93642eb5011e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:vXEYOvaM2JhixxYml/MB3pIPwT5XHFYnYUbXKBTecMbfNFSzCAW
 sglEHnYhxBF/QKA95KliUnr88huv3OXl/oBThbevXPvjUzrL9ptOZyioC1KoLyERAw31xRH
 PYYKTd8TQ++HEf7YLdU7+tBTUrXTMRnG6PX70ZHo/+WWQ3PjsKw9ikG+Jm57wme+sNXBb8h
 9eluliCCFKTyVWamrGCUw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lvl8jcAGd20=;KMJvMO4Y+WSHny/FBJphtdHFrTK
 BTDkJfKQvgkXEAug1o1JXvo58g2oP7YquGiQlBi4/zX1n+/ke6SGlbvAooBsnLF+Q4Q7oaJsC
 zhU/CeXLiYFdlEzqmzb/PpjaEjixr80Sh7WhFm4Sc6grg+s5Uoj0HlM1RHPKSDSXZLu0SE/Kf
 PFmItSaAb3esTcyundO+svoGaQDWqgHMHbcFfvvVaFDyIN/Klp3kqtBa1eW7rJLe6o9Vzb4Wm
 I6dCBxgdtvr4mcbx+glBoGJN+2VALSFoK/QYsMK5S3Ll2z4y6W80fZAcfAOWxQdiEdxC1Dmzf
 9lv5xmXcmfvdgoCkpaugjtGsTckjM4T/w0L9c2GuMBNIeCjn7rQAu7a4y5hWyaoAL9NR0GcQn
 WYYbZ0Nu/dpj1Q2T4wbwHc/28eXeLnd1ZekBiuCh/aS1cU5tFE78RMm1qmFwoc/wyhb9DPxDm
 3W/bE2FGYjWEQD2L1nSw0VQ1AfBOcOyp2480d2RJKZCuVrvxjKjQGmEEhEBMewv+YZT3Xl22o
 CqI80ZrnUA+YWIt6MfdLeugOweV3Oz93UwvR7fuOktr+eG9cMkdHKCJPFlhHSY0fIn/wpVzhB
 iJoFoRqXIpWNCfpXFZb2N1KJa5A5Yaj3rl/PO8vhW/e5pclPMrQDDxXAmqXsngt+MDGv/5UJ+
 aYzgEE4a0i1sBhJoER1ptjqf7trZH0VA86gk+vAUXB5dY8xXdkk8xPAA42BGv4nPgzw07xOFt
 gs04oBU0ZR4UK9gUGkqryvTQn7BsPuLBjhJr0ifUiB1pBhYfn1XdDkM7u3BALBBnrjNqirh/z
 hlX1oRumBXo4GAWZWQVYWHrLkRrIYBA3Y0I3wAghzRnkw=

=E2=80=A6
> Add the missing calls to fwnode_handle_put(child) to avoid memory leaks
> in the error paths.

I suggest to apply a goto chain for a while.
https://wiki.sei.cmu.edu/confluence/display/c/MEM12-C.+Consider+using+a+go=
to+chain+when+leaving+a+function+on+error+when+using+and+releasing+resourc=
es

Will the application of scope-based resource management become feasible wi=
th another delay?
https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/cleanup.h#=
L8

Regards,
Markus

