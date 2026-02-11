Return-Path: <linux-leds+bounces-6931-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBOnOg3xjGmSvgAAu9opvQ
	(envelope-from <linux-leds+bounces-6931-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Feb 2026 22:13:49 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6EB127A7F
	for <lists+linux-leds@lfdr.de>; Wed, 11 Feb 2026 22:13:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C5F5B302FA13
	for <lists+linux-leds@lfdr.de>; Wed, 11 Feb 2026 21:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05AD35F8BD;
	Wed, 11 Feb 2026 21:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="guF0WGNO"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A863E35E535;
	Wed, 11 Feb 2026 21:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770844426; cv=none; b=s1Ty3bdBNZLEpcjDvlYlFHE9TxFRdKe44Jaol0GHny8EgCzLX/lsaZj/rvAXAM0vg+zljHh68pbMX04j9itE9bXvk8M/g+bQ9pDlZlSPZugea9WGzXk9RXCtG/h/JPlV9BBSoFa1qLQifYaMbo9mrf4tT0y8UQO4HGffIfQhMSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770844426; c=relaxed/simple;
	bh=2SFhjjO4JhhiGOVpntjjr7EQH+F78lsZmlsaKg9GT68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wbqjtj/5XILEydk44pHXk+cxDAcbJtludFhntfKl0IX9Mrmy2G4XIri0Pz158tFsHRjHRkIXk0V72M3SHyoPp9P7FdeDJskOOTBdk9aKedm9cBxGg+zyCKoJLDzXXTklSUCxlbU0LKR4s5VsiM+zftITJiiVqWJI7z+rTeQT21E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=guF0WGNO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD4CC4CEF7;
	Wed, 11 Feb 2026 21:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770844426;
	bh=2SFhjjO4JhhiGOVpntjjr7EQH+F78lsZmlsaKg9GT68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=guF0WGNOcIuWywfnCvCQVG5nhbp9wrsyUHsG6D2rwDHQi7hYB8QUNqkSJAinjuubZ
	 ur3bTWwInBHwXCOs5OzpCXg/+Rof7sIcw9Chm4GuYV8Fbr9jSVdAB7j5nWN7gWZYpN
	 Mfgs/JCEn4ixDcBEG9NyJ6++i17uQasYGHgQ3ZaIzLlnAnnrQ5Ui8dPFfjfqFVTFqG
	 E531xE8dlXeJUyqIrLVwRmsK5lD+C/XX3pBX6n3VrU0w4dgTitbG75mxbdriY+caya
	 TDGJOvY1/ubWZlBbRgVmnEhuFwnNE3fGomDE7wK3cmx5jEFqmlEokxN6/uhIUl9xbO
	 +KB28HYIcC8Fw==
Date: Wed, 11 Feb 2026 15:13:45 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-input@vger.kernel.org, David Lechner <dlechner@baylibre.com>,
	Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	devicetree@vger.kernel.org, Dixit Parmar <dixitparmar19@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Pavel Machek <pavel@kernel.org>, linux-iio@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>
Subject: Re: [PATCH v2 02/11] dt-bindings: regulator: cpcap-regulator:
 document Mot regulator
Message-ID: <177084442495.3910352.7057800020774400525.robh@kernel.org>
References: <20260206172845.145407-1-clamor95@gmail.com>
 <20260206172845.145407-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206172845.145407-3-clamor95@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-6931-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-leds@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,baylibre.com,kernel.org,gmail.com,atomide.com,analog.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8A6EB127A7F
X-Rspamd-Action: no action


On Fri, 06 Feb 2026 19:28:36 +0200, Svyatoslav Ryhel wrote:
> Document regulator composition used by the CPCAP of Tegra20 Mot board,
> that is a base for Atrix 4G and Droid X2.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/regulator/motorola,cpcap-regulator.yaml  | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


