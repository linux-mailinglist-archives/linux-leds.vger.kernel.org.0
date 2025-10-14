Return-Path: <linux-leds+bounces-5776-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E55BD807A
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 09:56:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB9671890C54
	for <lists+linux-leds@lfdr.de>; Tue, 14 Oct 2025 07:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E1E30EF92;
	Tue, 14 Oct 2025 07:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=commetrax.com header.i=@commetrax.com header.b="Rw1taC6q"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail.commetrax.com (mail.commetrax.com [141.95.18.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B6130E821
	for <linux-leds@vger.kernel.org>; Tue, 14 Oct 2025 07:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.95.18.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760428575; cv=none; b=ql65e5gv2iXjrK2nPRrUsZfIM/+1myUP9ZiRF82uRW+L6+8nIyHk1kQPqg1kHmEYgkABVOOZWHIsyIFw1AZxbl9yPV1eFbPrdQNLOqvqdfPHbWxbw/ygtvmF9ByRdBRJ1VkG69kkBS9e8ZZjMH5EcwaVq0h1lkDBZYwhC5K+xP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760428575; c=relaxed/simple;
	bh=M2z+nFeXqIRcbI6rcgrOtIQjqLLid9ZQ1XheJsIeFLM=;
	h=Message-ID:Date:From:To:Subject:MIME-Version:Content-Type; b=tKNZQkrX7X28TJNM27NZJCBsPMfoh/2JN6XWLARrOsT7tZQLjguv3C1N/NGAonY/Fd6FhYiyDUxs9WHaQuUIItkSJ1pYSriBj0l6DqisQbHOYoDUzsCyQmZWOFAtPw3UQrRwG/arQH/HDnkM+Dsp0FAqj8pqJm16KldIwFYNzAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=commetrax.com; spf=pass smtp.mailfrom=commetrax.com; dkim=pass (2048-bit key) header.d=commetrax.com header.i=@commetrax.com header.b=Rw1taC6q; arc=none smtp.client-ip=141.95.18.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=commetrax.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=commetrax.com
Received: by mail.commetrax.com (Postfix, from userid 1002)
	id 8372624087; Tue, 14 Oct 2025 09:55:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=commetrax.com;
	s=mail; t=1760428568;
	bh=M2z+nFeXqIRcbI6rcgrOtIQjqLLid9ZQ1XheJsIeFLM=;
	h=Date:From:To:Subject:From;
	b=Rw1taC6qLDrom3Yfi3pbDG7WCiAo3eon9g/fKgO3JNrEBd3KkXdjUIeQl/bCdXq65
	 dFEWjZVFmsgr2Xd0Oa/pC5Y758XlkVb9lWIISFSk7nR+m3dVVpOfFi2x7pefAINWOB
	 6HrcpTh+edyPosmcBWypQ2oacZ38yMN8Nn812rNqmmUurdMptioKcVtprTQ2ZaEMG9
	 N8UHg9tjJKz4e0WZ8VopzmR7FkqoRSL9jANb8iwPVT/Y+LM/NONANR+lk+bcSC49BX
	 vb+jbdNR64PdDQZ1A/STtAATTudJLfdnftl7ZHUwN5DStgb8oLjzYnKqxwra0dI7DI
	 pfoaEQ/50B7yQ==
Received: by mail.commetrax.com for <linux-leds@vger.kernel.org>; Tue, 14 Oct 2025 07:55:46 GMT
Message-ID: <20251014084500-0.1.c9.16n6a.0.gc202z7cm1@commetrax.com>
Date: Tue, 14 Oct 2025 07:55:46 GMT
From: "Luke Walsh" <luke.walsh@commetrax.com>
To: <linux-leds@vger.kernel.org>
Subject: Welders ready to work
X-Mailer: mail.commetrax.com
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

we support companies in carrying out industrial projects by providing wel=
ding and assembly of steel structures =E2=80=93 both on-site and in-house=
=2E

In practice, this means we enter with a ready team of welders and fitters=
, take responsibility for preparing the components, their installation an=
d quality control.=20

The client receives a complete, safe and timely delivered structure.

If you have projects that require steel solutions, we would be happy to t=
alk about how we can take over this part of the work and relieve your tea=
m.

Would you be open to a short conversation?


Best regards
Luke Walsh

