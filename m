Return-Path: <linux-leds+bounces-7302-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QA40HrKzsWnbEgAAu9opvQ
	(envelope-from <linux-leds+bounces-7302-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 19:25:54 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D409B2688E6
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 19:25:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 267E5303715A
	for <lists+linux-leds@lfdr.de>; Wed, 11 Mar 2026 18:23:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 650183E4C9F;
	Wed, 11 Mar 2026 18:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b="gW1HW5As"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DCB3E1200;
	Wed, 11 Mar 2026 18:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253432; cv=pass; b=S8michH8qQ2JfTrj+jZ3NGSk74+wQ96Mk5eBlu0KTn9cFVeUUhg30ldBQFrjzoeMfgjxTpUyn2tHvC5zgIwctrvCXPMGxT4ZS4SVgo07qU0zSe9NgamDlLm72An40oUMPqg/hqtOVenyE8yIsFmsxQSKrdzMVgz3yZPxb1Mxx/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253432; c=relaxed/simple;
	bh=yY/pCb+CB+pq4XV/4sw57sbHCb95u3MWcH+1fET0K1Q=;
	h=Message-ID:Subject:From:To:Cc:In-Reply-To:References:Content-Type:
	 Date:MIME-Version; b=GIroxpARnuqwmlvgtpwLPKkVRKnmUAZve/534Hyiau4/hJBPDXWI4eA+IXjSxGpu6E3RcIpRJMnrB0Ja7WFpEz9tuT1gzvdUIQYuwOh31KaxNl2f4seBF9fpfR1FQVzkTgyR7oxYu/QYynwNVu+NmF8J7P3G2ktNDya3KiaU04Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe; spf=pass smtp.mailfrom=rong.moe; dkim=pass (2048-bit key) header.d=rong.moe header.i=i@rong.moe header.b=gW1HW5As; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
ARC-Seal: i=1; a=rsa-sha256; t=1773253408; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZuCSgyn9RtJCiPM3WDMI4oHCpcnSnZmks7MgxKvV9KWh2iqwf8ex6yZFMnqbUyXGhIAGghJHDASk/BfugaPftAhT4FgCtdYlVzOvqbM5G9wC4T9pa+zgCkFHiXKvosLtTr877pJY4Uag11mx5ekd/NUV+JLfgrYaVilH26gF9/U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773253408; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Wl0Yd7xpqyZcnXgDUZsmTbSJsY/qtMyfwr0uenBmh1s=; 
	b=Jb65iTW8zTIG6DIUUhLrjYNcwmb2E6G1FNKf4IcTAV9w+RsMYsPAQqeCoAxo7xljv+wz7eCmIqJjXBzHaQlNsAwqBKWIEKO6BHxCDLI6/2gt4anh1amNf6K3cLUMzziCJTNQAISqTVCpVlCBPwQ3Fa42uGrA8u56bWvrlkO4pNg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773253408;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date:Date:MIME-Version:Message-Id:Reply-To;
	bh=Wl0Yd7xpqyZcnXgDUZsmTbSJsY/qtMyfwr0uenBmh1s=;
	b=gW1HW5AsUqj1WLp5gG1/jSQrUUjlSA4t/1/YMcT+0MZbSp0eYBpP5mfzeLpNrB0Y
	NJBsvUrcn3A+9oX6Pckld1zwaecnb9JGEaOsEKR9jokCF3mm33C3gpev5/kOpK0cMgK
	BUbsuoPNEFaZ/PGDgCmIn7Ba9PlFFiwbcLmzQYmhhSYRrNKcQ860ozZTex80ThNEqbI
	fR1dtANZe25oCxA1y8wXTR9W3Scft3u08J3ww5wSeeTpMuEOVdkl68q9H4LZt6tAgDq
	2zlU6WnFwcZtOdzQH1ma70QKSk+O6MyDFSeMbGnOgHRChPDCpQVSNNVoKg/eAPnOiBh
	TxOcOZyZhA==
Received: by mx.zohomail.com with SMTPS id 1773253406326114.68008993957744;
	Wed, 11 Mar 2026 11:23:26 -0700 (PDT)
Message-ID: <04b5729c514c01c47cd4261a3c608d48bdaf33e4.camel@rong.moe>
Subject: Re: [RFC PATCH 0/9] leds: Add support for hw initiated hw control
 trigger transition
From: Rong Zhang <i@rong.moe>
To: Andrew Lunn <andrew@lunn.ch>, Lee Jones <lee@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>, 
	netdev@vger.kernel.org, Pavel Machek <pavel@kernel.org>, Thomas
 =?ISO-8859-1?Q?Wei=DFschuh?=	 <linux@weissschuh.net>, Benson Leung
 <bleung@chromium.org>, Guenter Roeck	 <groeck@chromium.org>, Marek
 =?ISO-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,  Mark Pearson
 <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Hans de Goede	 <hansg@kernel.org>, Ilpo =?ISO-8859-1?Q?J=E4rvinen?=	
 <ilpo.jarvinen@linux.intel.com>, Ike Panhc <ikepanhc@gmail.com>, Vishnu
 Sankar	 <vishnuocv@gmail.com>, vsankar@lenovo.com,
 linux-kernel@vger.kernel.org, 	linux-leds@vger.kernel.org,
 chrome-platform@lists.linux.dev, 	platform-driver-x86@vger.kernel.org
In-Reply-To: <f3e2e601-ec12-46b4-8986-c2d997e48572@lunn.ch>
References: <20260227190617.271388-1-i@rong.moe>
	 <20260310121024.GJ183676@google.com>
	 <f3e2e601-ec12-46b4-8986-c2d997e48572@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Mar 2026 02:18:03 +0800
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Evolution 3.56.2-8 
X-ZohoMailClient: External
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[rong.moe,none];
	R_DKIM_ALLOW(-0.20)[rong.moe:s=zmail2048];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-7302-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[lunn.ch,kernel.org,vger.kernel.org,weissschuh.net,chromium.org,squebb.ca,gmail.com,linux.intel.com,lenovo.com,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[i@rong.moe,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[rong.moe:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-leds,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rong.moe:dkim,rong.moe:mid]
X-Rspamd-Queue-Id: D409B2688E6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Andrew,

On Tue, 2026-03-10 at 20:04 +0100, Andrew Lunn wrote:
> On Tue, Mar 10, 2026 at 12:10:24PM +0000, Lee Jones wrote:
> > I'd like for the netdev folks to take a look at this please.
>=20
> Before i get the rational of these patches....
>=20
> Have they been tested with CONFIG_PROVE_LOCKING enabled? My experience
> with networking is that it is very easy to get tied up in AB-BA
> deadlocks. You need the LED to be as dumb as possible, it is always
> logically 'below' the trigger. Having the LED calling up into the
> trigger generally gets you into trouble.

I will test it. Thanks for your reminder.

Thanks,
Rong

>=20
> 	Andrew

