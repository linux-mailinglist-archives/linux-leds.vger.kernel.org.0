Return-Path: <linux-leds+bounces-6851-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aCvDMCKnhWmYEgQAu9opvQ
	(envelope-from <linux-leds+bounces-6851-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 09:32:34 +0100
X-Original-To: lists+linux-leds@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 485E1FB899
	for <lists+linux-leds@lfdr.de>; Fri, 06 Feb 2026 09:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7678C301D302
	for <lists+linux-leds@lfdr.de>; Fri,  6 Feb 2026 08:32:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575CE31B124;
	Fri,  6 Feb 2026 08:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=venturex.pl header.i=@venturex.pl header.b="dMOJyi5o"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.venturex.pl (mail.venturex.pl [141.95.86.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B7731960B
	for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 08:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.95.86.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770366727; cv=none; b=jj4X/DOljw/vRhwGdX3V+OVGgBoz3VmwqgE5k0WKjFrhiRtWIXs1O5VNH84fYhLPlIcqC573yr888QH3AyQyQpJnGz0ZXQLlvtV+KRv7xWDqzmXHTLlDPBJPSsn/ZrzsdySrEvZn3oZw9RUu4q1AMN6O9DLTAaUD7ht0BHT/rUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770366727; c=relaxed/simple;
	bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=IRKwTmVBF7LTza0CZfpE2GFJD0yXSRMyt6uihzMz0wxrM/A3kcxs0yMDHRLy2lFXFFtoMtgNA/5z9hR335e8p8rSQvTPNUL2/TuVdLSbb8uubbC+BWJqaoqFQZtJAPukHSQjQgy0TLujuYCLPXGb4bwya3ItupGiRUkeXfV+2oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=venturex.pl; spf=pass smtp.mailfrom=venturex.pl; dkim=pass (2048-bit key) header.d=venturex.pl header.i=@venturex.pl header.b=dMOJyi5o; arc=none smtp.client-ip=141.95.86.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=venturex.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=venturex.pl
Received: by mail.venturex.pl (Postfix, from userid 1002)
	id 26FF123F2F; Fri,  6 Feb 2026 09:31:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=venturex.pl; s=mail;
	t=1770366725; bh=86VIaF2unP4vg5OpX+J8tHPXWoQ8hu3kSDMcmnIkxvQ=;
	h=Date:From:To:Subject:From;
	b=dMOJyi5ooMAwYrRBSy9sT2i2XlWF8fVvofPb0AJ9bXKmuV9WFXCuVXsi58jCXa4ey
	 DaQoQ1xonTyGtSV7V8vBH8NvGW3a+OE0thY3jvsfT68dETY/IMK/oMqoPXvI7WQUkn
	 gRlpiHSo+XGo7LUkH8cMJpPAjYayi39i3OSBuKpTSbG0YNrgaBfCtNJDmRCyMiNMkI
	 UVxvt/lXSl7u+LWrI+Jxnzm05fnk0ZYbPZUX/MzohpGUMtYdZRP42x7JIkYUFHa8D6
	 jnM40EZCb4siG7mkAg1WqFufw48hyuajvCxDxluMzTK5Q8Iyl6gDW2dXddGhZumbbn
	 iSsyyGzDG4BuQ==
Received: by mail.venturex.pl for <linux-leds@vger.kernel.org>; Fri,  6 Feb 2026 08:31:06 GMT
Message-ID: <20260206085537-0.1.cj.2jw10.0.59of9r0m51@venturex.pl>
Date: Fri,  6 Feb 2026 08:31:06 GMT
From: =?UTF-8?Q?"Miko=C5=82aj_Rak"?= <mikolaj.rak@venturex.pl>
To: <linux-leds@vger.kernel.org>
Subject: Fundacja Rodzina a optymalizacja podatkowa 
X-Mailer: mail.venturex.pl
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [12.35 / 15.00];
	FUZZY_DENIED(12.00)[1:b639f4eae7:1.00:txt];
	SUBJECT_ENDS_SPACES(0.50)[];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-6851-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[venturex.pl:s=mail];
	FROM_HAS_DN(0.00)[];
	GREYLIST(0.00)[pass,body];
	DMARC_POLICY_ALLOW(0.00)[venturex.pl,reject];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[venturex.pl:+];
	NEURAL_SPAM(0.00)[0.999];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mikolaj.rak@venturex.pl,linux-leds@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10];
	TAGGED_RCPT(0.00)[linux-leds];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,m.in:url]
X-Rspamd-Queue-Id: 485E1FB899
X-Rspamd-Action: add header
X-Spam: Yes

Szanowni Pa=C5=84stwo,

czy byliby Pa=C5=84stwo zainteresowani rozmow=C4=85 o mo=C5=BCliwych rozw=
i=C4=85zaniach dla swojej firmy i rodziny?

Nowelizacja ustawy o Fundacjach Rodzinnych otwiera przed przedsi=C4=99bio=
rcami zupe=C5=82nie nowe mo=C5=BCliwo=C5=9Bci ochrony maj=C4=85tku i plan=
owania sukcesji. Fundacja Rodzinna pozwala oddzieli=C4=87 aktywa od ryzyk=
 biznesowych, prawnych i podatkowych, a jednocze=C5=9Bnie zachowa=C4=87 k=
ontrol=C4=99 nad swoim maj=C4=85tkiem i zadba=C4=87 o jego trwa=C5=82o=C5=
=9B=C4=87 dla kolejnych pokole=C5=84.

Co istotne, po up=C5=82ywie 10 lat od wniesienia aktyw=C3=B3w do fundacji=
, roszczenia o zachowek przestaj=C4=85 obowi=C4=85zywa=C4=87. Ustawodawca=
 przewidzia=C5=82 r=C3=B3wnie=C5=BC liczne zwolnienia podatkowe obejmuj=C4=
=85ce m.in. dochody z dzia=C5=82alno=C5=9Bci gospodarczej czy wynajem nie=
ruchomo=C5=9Bci.

B=C4=99d=C4=99 wdzi=C4=99czny za informacj=C4=99, czy chcieliby Pa=C5=84s=
two pozna=C4=87 mo=C5=BCliwo=C5=9B=C4=87 stworzenia Fundacji Rodzinnej?


Pozdrawiam
Miko=C5=82aj Rak

