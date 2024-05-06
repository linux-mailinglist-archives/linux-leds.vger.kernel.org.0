Return-Path: <linux-leds+bounces-1613-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE72C8BD3AD
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 19:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 380D41F229BB
	for <lists+linux-leds@lfdr.de>; Mon,  6 May 2024 17:10:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAE2315746B;
	Mon,  6 May 2024 17:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="gJ61EK3H"
X-Original-To: linux-leds@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E551DA21;
	Mon,  6 May 2024 17:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715015432; cv=none; b=rR6mx94fRjhT3VcqylXtjXSfedIQTljKYvuHi7vqaxGDn1aNXqWwn2pOCnUKGMtTpZ/0d7iib6qsSeNRY4IqzLArMDJHGEN/o3KiB+T4kQA3EXQXvexVb6XwZhxM1uDfDirtcOmgQ7HT5ynla/ISYrWnCVdF0C8Pqe6hF4341RY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715015432; c=relaxed/simple;
	bh=nQ6A1G+YfyilvCrEbNSMZohi4VS6CsKNHby1nOKnoBw=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=eUUCpHl7342VOShLy+RaK7UypsFaR29NHDjfYmmkSEL6O2oJaZtNFOk20PZwH3pVcU9E81JH8JQ0ilMFPMhGMRZc8sBgAzbH5xCyrTmQNe8Bk1ivlfNrmIybo+GFbUt3esmGVnFjvC07xQZyhEOdyCNZmmhvMtPxXCSMqvUoskc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=gJ61EK3H; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1715015403; x=1715620203; i=frank-w@public-files.de;
	bh=LJYIL0LCua5I7GyM9P2JXLRaCpX35/16NeySh6HEz6o=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=gJ61EK3HSaS0aZI9ASubAm20Wp3cx6GXxil8fV43mga0mAFkDsmIDUjNVPKPqyQf
	 Y7ZILUyY6nLw9wU1wMWFS1PFsbcTjfCiPlB97xyw9oRzcYYghMaRVHpkchxRLZ+MV
	 QO64+mziqBWEF4M4IpVlKnHczaVa8QsDOutyFZGOpDLhgNIIHaQrG3HpFUJIFcFtW
	 rFocsDoMvyMIkhkhdjUjtzOoRVmouGHRNJ5sZN2pyqOhYAzTyL/BeyTAZmL66WInT
	 QBzob+1YvWtadVt5PTBBX4P0VxAqSfa4wLRebyyVob/rAl0Qn119VPbXDQhuUtQsA
	 liWTqm5vodISZ73ASA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.77.247] ([80.245.77.247]) by web-mail.gmx.net
 (3c-app-gmx-bap23.server.lan [172.19.172.93]) (via HTTP); Mon, 6 May 2024
 19:10:02 +0200
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-c7cd6e30-cb34-4405-9527-6e183179c302-1715015402906@3c-app-gmx-bap23>
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
 linux-mediatek@lists.infradead.org
Subject: Aw: Re: [RFC v1 1/5] dt-bindings: leds: add led trigger netdev
Content-Type: text/plain; charset=UTF-8
Date: Mon, 6 May 2024 19:10:02 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <8e9fd4c9-f537-4413-b8c8-988b001b64c0@linaro.org>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-2-linux@fw-web.de>
 <8e9fd4c9-f537-4413-b8c8-988b001b64c0@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:yRoHSmlYbliSr60RvZ/khIxq1E6EyLOJH41wAY3Q/leEpoCx389vdror4fKSCp25ghFTm
 GMwxlI3pexIMgnV0dR1Vfjm1xbHoM7cWgG7ujE65mpiq8YFtCWcnacKC2SMfw5f4FnJ+plyt4Eg1
 sXc/a43oIPgvMX1agXXTcW/jhtU7ZDHTKGtlmg/95oPdctGctcuuugw0zBnmOlh5Mzdk+Q/1ZHld
 +V5YFDwz0kXK509qQTItQhKsSjgb44Eaxv0VFiUxLJnDI3jXnqYkC+1RFEcUUsZMmGZ2azAWd9RN
 yQ=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oA+GDCWG4pY=;FwAfG1QfD2P5ddgCezPknjt5fut
 O9rd4YXgF2vtgT1ezSDqbfmnqO0LJVH8lL1EjCEW/gfdWBglenGT5ONqYeY6tDSwpuHfKeRBr
 99oWdvwEworRPcopiI7G9Fpq8Z1DIo/uHNV6LfxdDP0CuLsjyFciGvD92CRlueGYJ+VcE8lA0
 03R2gTus5YPdDOaRwL8Ym5LED/oFAg1ztfCq/ziM4qina23/RrjSZcDJbiRa1CmqMSUieAcro
 1Ke0vcD8xrPrSokeft7j3ei5Y76+vSTfeuB5XAU/uIVdL8J72VzyL2BmoN/LIcIfVA2Skgp56
 UAo54QmjW2NnQVGB0XnnTQEuyN2PUwFjXLmNJsGAUhnnTDzKGG7isfJjwWARvTPg0z+JqLisu
 cHFxz0TMUisCeXVfoQxBVG4TnUgBwzKD5c1HSTCHZnMHeZC+2d+mZCTJd5bEiWp5F0wEpO7hp
 EzV5DofsWov4ADAunGKXJOaxUnIpS42ApPoJ+pS5Sv2sS8ubT6BGx5fu1XCfKk67VOIDvttGz
 AzRPjX5XwBGDgCWv4sEILlvjyoRKR9FiG1cCzkJTv9Sab5l1HRclU9LFzPuCqS52gdVSQd1up
 CXYorKl4+KWOR3mz/Cis47bVXm137VXZX2zlLUduN2x44x8nTUoGTivqjzw86fNusaX8M7DHc
 GEsxu2a/cWR1qEitW+A4yxCkUmjXF1nAHhdCMrfBXyyoTIoAjdt7DPjph1tmIxE=
Content-Transfer-Encoding: quoted-printable

Hi

> Gesendet: Montag, 06. Mai 2024 um 10:18 Uhr
> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> An: "Frank Wunderlich" <linux@fw-web.de>, "Rob Herring" <robh@kernel.org=
>, "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Doole=
y" <conor+dt@kernel.org>, "Michael Turquette" <mturquette@baylibre.com>, "=
Stephen Boyd" <sboyd@kernel.org>, "Pavel Machek" <pavel@ucw.cz>, "Lee Jone=
s" <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Eric Dumaze=
t" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni=
" <pabeni@redhat.com>, "Matthias Brugger" <matthias.bgg@gmail.com>, "Angel=
oGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
> Cc: "Frank Wunderlich" <frank-w@public-files.de>, "Eric Woudstra" <ericw=
ouds@gmail.com>, "Tianling Shen" <cnsztl@immortalwrt.org>, devicetree@vger=
.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linu=
x-leds@vger.kernel.org, netdev@vger.kernel.org, linux-arm-kernel@lists.inf=
radead.org, linux-mediatek@lists.infradead.org
> Betreff: Re: [RFC v1 1/5] dt-bindings: leds: add led trigger netdev
>
> On 05/05/2024 18:45, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add led trigger implemented with config-symbol LEDS_TRIGGER_NETDEV to
> > binding.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >  Documentation/devicetree/bindings/leds/common.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/leds/common.yaml b/Docu=
mentation/devicetree/bindings/leds/common.yaml
> > index 8a3c2398b10c..bf9a101e4d42 100644
> > --- a/Documentation/devicetree/bindings/leds/common.yaml
> > +++ b/Documentation/devicetree/bindings/leds/common.yaml
> > @@ -113,6 +113,8 @@ properties:
> >              # LED indicates NAND memory activity (deprecated),
> >              # in new implementations use "mtd"
> >            - nand-disk
> > +            # LED indicates network activity
> > +          - netdev
>
> "dev" is redundant (there is no flash-dev or usb-host-dev). Two network
> interfaces are already provided, so your commit msg must provide
> rationale why this is not enough and why this is useful/needed.

i only see 1 network binding...and this is labeled/described with wlan and=
 phy

        # LED is triggered by WLAN activity
      - pattern: "^phy[0-9]+tx$"

which second do you mean?

btw. usb + disk has 3 trigger and "netdev" is already used in some dts, so=
 i thought adding the binding is a good idea

arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts:107:			 * linux,default-tri=
gger =3D "netdev";
arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dts:52:			linux,default-trigger =
=3D "netdev";
arch/arm/boot/dts/intel/ixp/intel-ixp42x-dlink-dsm-g600.dts:51:			linux,de=
fault-trigger =3D "netdev";
arch/arm/boot/dts/intel/ixp/intel-ixp42x-iomega-nas100d.dts:39:			linux,de=
fault-trigger =3D "netdev";
arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts:138:			linux,default-tri=
gger =3D "netdev";
arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dts:27:			linux,default-t=
rigger =3D "netdev";
arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts:107:			linux,de=
fault-trigger =3D "netdev";
arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts:113:			linux,de=
fault-trigger =3D "netdev";

first one has it as comment that not yet in binding and with not that it n=
eeds to be set in userspace
like Daniel stated in the dts patch (does not work for phys)...so i drop t=
his patch and the property
in the dts.

> Best regards,
> Krzysztof

regards Frank

