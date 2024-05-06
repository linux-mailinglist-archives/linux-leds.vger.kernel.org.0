Return-Path: <linux-leds+bounces-1612-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCE38BD32F
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 18:52:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0F237B21014
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 16:52:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D445156C69;
	Mon,  6 May 2024 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="ZJMOhgOa"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0721156962;
	Mon,  6 May 2024 16:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715014331; cv=none; b=UZdR86kZ5gK2l1nQ/NYt+pD4zk8AKvfTLapWXXp8TblnR/D8b88ogcp13mcGZ5XxnrWsFx3BkfC4b25chi50wgQpPgJpw7e4SJ1MNwWiJjmEBe/7fNkkj+wfw6bZdNpidx9xJOIA/TlaolI8t88dWwVO2DfFrM2z8Uy4I1wM7j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715014331; c=relaxed/simple;
	bh=431xomHZAYW2VIoAdzUhyTCyJVUNm310y6EPYBDR/MQ=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=i8kr4RwYpur7Mgzcc7Goa3WJMTwlxtoKb40qKMG9tTyIzTzl3TZ1FsXSQGWbAa8BUwBt94e1FGv5yiD2S3OMB/HsXRb22XQ3ShbCv7PGcu9zZukrnPU3/6ol5H88s/Z3lk2EqMLxUg5ksuZAhYUvrX2rMcnpLr1PQZ0iPCoK9QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=ZJMOhgOa; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1715014303; x=1715619103; i=frank-w@public-files.de;
	bh=IwqP/7Y2UdbLwDktzhmSvQ1RXPsSrkmi1XtKQnEU5/s=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ZJMOhgOaKoq2Ph9aUz+zN3cUTdYprV6pz+9vp0TklV/mxEjT5dcBOZdN8n/MHgsj
	 uZJOVLgY5rbwdC6lf5YKQf7zCp/lnoFb0fXuiwxzhkSbV5uJW/po6L8lpbPz8PM7S
	 5EWCAPpwo875gXwsUm98FWYpQI0m/kq9LDTbU31ay4bbFdq4uaj665h+JNIJZngN6
	 cMtdDOUnJO+tgLNJpLEJm6JqLUQaXhMgLOIQBfRIA0Zxf4qG4bZ2woDhXT5GEX00v
	 vd5ngkpvKgyV3abAUmeVPkHsrGPEHkX0Si8mcJQfE7YzD7HReqEdcba33+Iuy2x/I
	 ZvCtSViQrY/dE7UFjw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.77.247] ([80.245.77.247]) by web-mail.gmx.net
 (3c-app-gmx-bap23.server.lan [172.19.172.93]) (via HTTP); Mon, 6 May 2024
 18:51:43 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-9ceb52ff-9a3b-4fe2-93f8-2e95b8ffb1ee-1715014303393@3c-app-gmx-bap23>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones
 <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Eric
 Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Frank Wunderlich
 <frank-w@public-files.de>
Subject: Aw: Re: [RFC v1 2/5] dt-bindings: clock: mediatek: add
 address-cells and size-cells to ethsys
Content-Type: text/plain; charset=UTF-8
Date: Mon, 6 May 2024 18:51:43 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <9f8237c4-f603-459a-9d34-9cda556874b8@linaro.org>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-3-linux@fw-web.de>
 <9f8237c4-f603-459a-9d34-9cda556874b8@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:3Tx8ITtU9FZAbAHnVZrQv0sGnxOJ7y55w3K4FyNlXKBO0OOrZTMZ7iPXAy0QoSb6Y7OrR
 OHP1cqr8ebHy9MA3C8iyt8voE5P7UohIVetGk1ZZ+JEnmShVktL642Q/CllLjuW1Zeeabdigrueo
 MEP2qg5Uq7eHLcBnES1UCzrOM74CPlfQxPD6Nd3agGY3Dmih954CFjcgqGqFqHFiFi54/d2P2668
 v8+QwlWfn7ELKzP3vVtD6YciGd4OmkyJd2Ya+99yXxs014VxFbL+kVmhh4AEZIWKiGBfBoMpEP53
 kY=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HqZgEzNzP30=;1Z/bVNz2Hg6od3fp1iQE8Dn5VyS
 EMECAIq92weuhOb8c8mleVtH7XDWJU47XhJV7CSFmtutIbyEKDwdL41WD5GYXOOqwUMf2XXAU
 0NOPFdiGzFDxcetA4IyMDIHE9gd/oUT5MflrTXniYf4hqofn1Z1xeV4UhApgq8JWMiy82IVAo
 VcMsngEWSVtjR5FBOm9mqK10zHiV7Z3/gdZBbYijlzN5+/WdYHL1QJYefIbnctzGs/H82hweC
 sSAg+e4G38eCfn5sDMBk48oas9UkM/eoZUpP7+3dhWOdyvvOcZ6KzQ6cuaq1xWUhqzO1svqbQ
 9H0n5FCYY+UEtvAx1dJOHQui14G0w69SG6tyKkuH9RVlEbFMBUXhN9ejUXKMBEwwIzqH9nUv9
 JJON+I5GCmgbsa3KaRcxsjxmdobOhDBoJicv/FrWTBqOFYRgvmnwqh+CLio2Wvd2joe9ZfBlm
 Pm7exN4QymBMZUZRMmUaE5DrF+H702+7i/mhCAlKxh89TbOpvgMhZHmzGk1MxsSxcQnEU19/7
 iohn9RievoaAAR3BsEtdfWPZkKuFDC9yLx7vpNiHFm+ISVfJFrDysgJFKhlN6ddvI5Y7n12d7
 SB6A1MnomcyH1qpn3uYNPaLtnr5z4b0KR4sJFFWF3YTUn1/ig0HmBFr/2jC9Bjcd/ytLJ1G3U
 vMZJGgxPW3Mxk3q/x4a3fSUL22PvZ7DqxSALrDogsl+WOny5eNVViwT0POtGKQ8=
Content-Transfer-Encoding: quoted-printable

> Gesendet: Montag, 06. Mai 2024 um 10:18 Uhr
> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> On 05/05/2024 18:45, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add missing properties already used in mt7986a.dtsi.
>
> Missing for what? Or why? Provide context, IOW, explain why they are
> missing.

ethernet-node in mt7986a.dtsi hast reset-cells-property

https://elixir.bootlin.com/linux/v6.9-rc1/source/arch/arm64/boot/dts/media=
tek/mt7986a.dtsi#L559

and

address-cells and size-cells are used here:

https://elixir.bootlin.com/linux/v6.9-rc1/source/arch/arm64/boot/dts/media=
tek/mt7986a.dtsi#L495

i saw the warnings while checking my r3mini dts...

arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: syscon@1500=
0000: '#address-cells', '#size-cells' do not match any of the regexes: 'pi=
nctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/clock/mediatek,ethsys.yaml=
#
arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-mini.dtb: ethernet@15=
100000: Unevaluated properties are not allowed ('#reset-cells' was unexpec=
ted)
	from schema $id: http://devicetree.org/schemas/net/mediatek,net.yaml#

so i thought it is a good idea to fix this now ;)

but basicly not related to my dts as these are inherited, so i can drop bi=
nding-changes...

regards Frank

> Best regards,
> Krzysztof


