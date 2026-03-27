Return-Path: <linux-leds+bounces-7537-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EB4QCN1CxmlRIAUAu9opvQ
	(envelope-from <linux-leds+bounces-7537-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 09:42:05 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6734B34125E
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 09:42:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 62C95300B47F
	for <lists+linux-leds@lfdr.de>; Fri, 27 Mar 2026 08:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A9F13D6684;
	Fri, 27 Mar 2026 08:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="HclnjMe7"
X-Original-To: linux-leds@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1391D3A453F;
	Fri, 27 Mar 2026 08:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774600888; cv=none; b=CfOh69+2NbWbvHeBLAsdXsm6WdI5elxhWbsMpspGGYh2RSwdSKufVqw4wvtrQkocghEAFdIcAwLiy3mcrcfB1cv2/8q1Tu0b8gHpq5ptkbgcKXjrzu2EkQPPymI5UjCRWPIvwiFwGpWUEd65180GmPlSDuvfZnMKUOe61OLqAYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774600888; c=relaxed/simple;
	bh=fq9JTGo3oNehZ2jTqn0zteRFSrcthfNS+Aevbze4JtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EbfhdtCPhcuwLyxwXerg5UP51cHhnC57uWnZV2ebiGgjWmBGZUiP3jWMQZW0VGKcdiWzbAC+RaR6JGMBklDGMsaxUwMKomkWinDitsEGi/YbU2b94cNjJQRhknVZaqGAiVOlZUG93LY1TFS811Zr0xSScErGL5xwjE76Iofuc/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=HclnjMe7; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1774600878; bh=fq9JTGo3oNehZ2jTqn0zteRFSrcthfNS+Aevbze4JtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HclnjMe7VqtNBdrpZhXlxga5+RCIEvcQMVmsh9nM/Z6PfKcl1JZK2ClyuZMrdmC2N
	 VSggEUdZ+hHzzMtt8fEINQVJxxn272yBDa9LQ3a8Uackn6IxfiaECsjhC2tBdTBu1C
	 BQ4xNshjIuPVvDkWSobi0V7cKvGLX5CfTroPpNhB5ljzb8q6wlU1ehZ7tLd4l1KRX7
	 9DV8hPTF19oXuzwTYv89t+std2Q1zgmOVI9XrLLnSHQ/7DKBedLPf/twdYcag5MJER
	 6pQjMynD2zUqPyT9pP0wGKbx/LHMhVV5tCscRRwkrDGvw1SIM/FaboB4nbft+tR2tI
	 me9V2j2MoBMxw==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 74EAE1011B2; Fri, 27 Mar 2026 08:41:18 +0000 (GMT)
Date: Fri, 27 Mar 2026 08:41:18 +0000
From: Sean Young <sean@mess.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Biswapriyo Nath <nathbappai@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Martin Botka <martin.botka@somainline.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org
Subject: Re: [PATCH 4/7] dt-bindings: leds: irled: ir-spi-led: Add new
 duty-cycle value
Message-ID: <acZCrqffLvUpM7AW@gofer.mess.org>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-4-446c6e865ad6@gmail.com>
 <20260327-natural-wild-mongrel-5bcc43@quoll>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-natural-wild-mongrel-5bcc43@quoll>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[mess.org,none];
	R_DKIM_ALLOW(-0.20)[mess.org:s=2020];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7537-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,somainline.org,vger.kernel.org,lists.sr.ht];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sean@mess.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[mess.org:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mess.org:dkim]
X-Rspamd-Queue-Id: 6734B34125E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Mar 27, 2026 at 08:51:18AM +0100, Krzysztof Kozlowski wrote:
> On Wed, Mar 25, 2026 at 06:07:27PM +0000, Biswapriyo Nath wrote:
> > 30 duty cycle for IR transmitter is used in Xiaomi Redmi Note 8 (ginkgo).
> > 
> > Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
> > index 72cadebf6e3..0297bfbb275 100644
> > --- a/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
> > +++ b/Documentation/devicetree/bindings/leds/irled/ir-spi-led.yaml
> > @@ -25,7 +25,7 @@ properties:
> >  
> >    duty-cycle:
> >      $ref: /schemas/types.yaml#/definitions/uint8
> > -    enum: [50, 60, 70, 75, 80, 90]
> > +    enum: [30, 50, 60, 70, 75, 80, 90]
> 
> Hm, why is this enum, instead of 1-99, in the first place?

Well in reality only a few different duty cycles are used by IR protocols.
30% is quite common so that should part of the list. 

Having said that a range of 1-99 would be nicer. Do we set this like so:

 - minimum: 1
 - maximum: 99

?

Thanks,

Sean

