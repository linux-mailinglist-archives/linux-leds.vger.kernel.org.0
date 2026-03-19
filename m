Return-Path: <linux-leds+bounces-7402-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLEwLmYxvGnxuQIAu9opvQ
	(envelope-from <linux-leds+bounces-7402-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 18:24:54 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC262CFE92
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 18:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3B79F30A87C7
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2026 17:15:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2613EF671;
	Thu, 19 Mar 2026 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wmifc6xA"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BD93EF655;
	Thu, 19 Mar 2026 17:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773940510; cv=none; b=s0v9yiI55Gs2WAnsRo9Utdwk80fPmpn4EUQY8X7Jix9G9KjV5bpzNfZowwisT4luVYqmhLJ5B8ogVr3VZqDf8HxaP3+uOFbjVLNxxSVavpuOFNBlbSYuuRfqPZtVYqdWI9oqJJN5XN06ploPez7keTcY3OprJAZ6PPEnGvA8OOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773940510; c=relaxed/simple;
	bh=5NR+eo5cInJDnEaSr+U9FL2arkfqIndaMqIgeQtwDOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4Gk7O3aJ5vsq6jjNx5foQAV/vunbzO+nINTVWeO6niQm12zydCeiE8U9wTrv/0rTl7ehfHnpGoUS7fXVzh//ofgVp2MbmZvf11ImfGYUdtQz4k2wFwcqgnmTWigFLRsy1Z+rK7q5lui5hJ+4DvzikUsNfKMshcEu3WvBJdRLAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wmifc6xA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8A8C19424;
	Thu, 19 Mar 2026 17:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773940510;
	bh=5NR+eo5cInJDnEaSr+U9FL2arkfqIndaMqIgeQtwDOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wmifc6xAyrPwcXa5MKt7UdkXFtUPP0AFiYzY70aOJ/kLcKTUNDE8nj/AuaqvEoOaG
	 ALBTR/Vfg5kfRGvWvv0HufMNujTPgKviYGzODMmWRAw1MMBcVnj1C3uvR/mQEXESUw
	 ugzz7hQBYjhgQwqZTZwz7jcUVXiom6RXOrCgJlYBR9U7wPYaxU8Evk+bTRM9U1ZYHv
	 xMm49LT1C2hiatQ6PDq1qRMaYH+fDDfnPQ2oFKKhq+M2EoUAQB+dh0Gxcg1ZRPoOb3
	 s/v8e5a7LbrvFioiRaLSE/OUDPcmyehFLBvln5lpecWqB5taKe6H2buoW1nbOATAOK
	 IobSL1QU5c4aQ==
Date: Thu, 19 Mar 2026 17:15:04 +0000
From: Conor Dooley <conor@kernel.org>
To: guptarud@gmail.com
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: leds: rt8515: Support single-GPIO
 flash ICs with vin supply
Message-ID: <20260319-clay-igloo-e3d4b083c94a@spud>
References: <20260318-expressatt_camera_flash-v2-0-5c2b9a623dcb@gmail.com>
 <20260318-expressatt_camera_flash-v2-1-5c2b9a623dcb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="M69W3UlZx2YKGP8B"
Content-Disposition: inline
In-Reply-To: <20260318-expressatt_camera_flash-v2-1-5c2b9a623dcb@gmail.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-7402-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5DC262CFE92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--M69W3UlZx2YKGP8B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--M69W3UlZx2YKGP8B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabwvGAAKCRB4tDGHoIJi
0iGNAQDV2/P9ujNylH0I2dyuWSf8h4lnJT94pPGx8diLxYdXowD+Ky70nezeKbZG
gNscV/xl4bbxvEhlWo6qBG5QkhZ8LAo=
=pFSQ
-----END PGP SIGNATURE-----

--M69W3UlZx2YKGP8B--

