Return-Path: <linux-leds+bounces-3852-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 77235A21610
	for <lists+linux-leds@lfdr.de>; Wed, 29 Jan 2025 02:30:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3A181885D0A
	for <lists+linux-leds@lfdr.de>; Wed, 29 Jan 2025 01:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 981EB2A1D8;
	Wed, 29 Jan 2025 01:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b="eyR6tyZD"
X-Original-To: linux-leds@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91AFF450FE
	for <linux-leds@vger.kernel.org>; Wed, 29 Jan 2025 01:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738114224; cv=pass; b=u8AsncXt+vwriHTY65sXuimL2JE8k23oJTBiP+ZQpbyRJOwiHwmNx62sBdw7wr21Fc9n8THWRTjQkhCk1LqARyPm+qhdsJT3C+ETJ4VWseCvcfIc2ef5f7CYqMU+QwF3+uVd6njLBOwjdek17iMHTw5cpyM6hbjn7a/ckqcy59E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738114224; c=relaxed/simple;
	bh=Zc625JLDHhXVtmfNyzIXjHjsp+rUSkh4sorVREUDjTo=;
	h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type; b=HYiOpPCvC7ZJbWrN0geTD2BSrYN0ATKnQlYDRw9oQJLwEW9bQDncFfsjBZdgqvJ20iFhDrX+j8cA1sD3Zw7LUcFkMEOGVr2ewfjcjLBf2dD5GagYRGBtv4tZeZA73IucoMEFvLW4Zvok5o0HbXywCf8KuRgUN7nRe8HsV5y07Qc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au; spf=pass smtp.mailfrom=mcqueen.au; dkim=pass (1024-bit key) header.d=mcqueen.au header.i=craig@mcqueen.au header.b=eyR6tyZD; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mcqueen.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mcqueen.au
ARC-Seal: i=1; a=rsa-sha256; t=1738114220; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ax2YFaJtUR4eE2jvIPA1WWBp6jU8gzNSDFJPqXqzB18L3ltDGzj/jqJuzQrnhi4Ghcoii58Itjn4DOFX6Kw9Y42vGKvv759j7Qx2HK2TY4lvAyezKOkzyHF/oyU/IgBK4HGNtnXbG2nFdm3F7kMnxDa0iJ0XfuONh1t6iZ6/ciY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1738114220; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=Zc625JLDHhXVtmfNyzIXjHjsp+rUSkh4sorVREUDjTo=; 
	b=e6xmmZKxKb2xz8kMcEt6ic3xVBF93AYj6vT+q5AMNQqLZLKzTyXb+L2CMasmhFRJRftOJm6zneFg046OQeIMHAlBlAxhpg0GcwVT6JSU9IU6ZYpM3BmFsiEz8hf/W7yNGJEsyiBDV27FSIamiJD7OZN+OMbq0EtqY6pUEvUuaG0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738114220;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=Date:Date:From:From:To:To:Message-ID:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=Zc625JLDHhXVtmfNyzIXjHjsp+rUSkh4sorVREUDjTo=;
	b=eyR6tyZDaR5ptHglvGHGLxjJtRPbtFcSNYmYIJSZA71cBUbGCgQT8o6403kVxsDR
	eZwvRnDzuGRpbCOT+J+hu+lA7KqkvL1v38Ld8sTNTEVMSi+gWVzi785lwq+FyZBQWLf
	bzI4VnTjOpZl8pyGJ+ORpEoFr46x1xBXlvsHXYzs=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1738114219410371.09927939215663; Tue, 28 Jan 2025 17:30:19 -0800 (PST)
Date: Wed, 29 Jan 2025 12:30:19 +1100
From: Craig McQueen <craig@mcqueen.au>
To: "linux-leds" <linux-leds@vger.kernel.org>
Message-ID: <194afae3d7c.1209cb5e81043107.4471367016205969007@mcqueen.au>
Subject: Userspace LED triggers
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

I have a project in which I=E2=80=99m hoping to implement several interface=
s in userspace (several char devices with CUSE, LEDs with uleds, virtual fi=
les with FUSE, inputs with uinput, etc).

One thing that I=E2=80=99d like to do, but can=E2=80=99t, in userspace is m=
ake some LED triggers.

So, I would like to write a new userspace LED trigger driver, similar to ul=
eds or uinput. I would probably be able to contribute it back to the Linux =
mainline kernel.

* uledtriggers
* /dev/uledtriggers
* Setup by initially writing a struct with LED trigger name.
* Alternatively/additionally setup by ioctl() pointer to struct with LED tr=
igger name (similar to uinput).
* Implement ioctls for led_trigger_event(), led_trigger_blink(), led_trigge=
r_blink_oneshot().

Any comments on this before I start it?

--=20
Craig McQueen


