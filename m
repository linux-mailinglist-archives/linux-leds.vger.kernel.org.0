Return-Path: <linux-leds+bounces-1201-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA98877371
	for <lists+linux-leds@lfdr.de>; Sat,  9 Mar 2024 20:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3374281B13
	for <lists+linux-leds@lfdr.de>; Sat,  9 Mar 2024 19:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DFDC4AEFB;
	Sat,  9 Mar 2024 19:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZCMToveu"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9BD4A2A
	for <linux-leds@vger.kernel.org>; Sat,  9 Mar 2024 19:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710011322; cv=none; b=HEJJCBZ3370I16kynhcGX0BlVuTHEM2NuY0rXNHZEZC7YGmPrdDjejtI1n5mi7nXcd+J8iW/qzhw/D8TY0Y+tFnMzxzXqkuQJiPE5k3KzWaNuFDQpdT4GErn5VTWhiQ8n4/4QB6YlqsEUqmcITzST+1vi0FjfSzkSB3E+X4F8Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710011322; c=relaxed/simple;
	bh=WeZJAMuuusafm9DA9qTV2WXme+MYdkFxZbHWybZA2n0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EAKhAaKyLELQAOiwHyQ+wt0LuTfj5RjSue64MIzUQSQ4Ei9teNOb4rWkEbrYtP6lWI1qvnGJAZgeK4TIWrs7FL9WCrqZPGIYghT9V4kk3e9ub4+rql0Oh04BXJyQ/eZI58OleH8WY1aIlcIetB4NEvJhQH2LfKYhVGI/HRDkLn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZCMToveu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710011319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wvPQu/Ayt0eR2vMoFT3Nty49nNL2HrMsOTZZDqY5NK0=;
	b=ZCMToveu4Thh358TDATu+VV/EPypJqXyG1kk68BRMh5/6//VChXj/gW5k6Fy0I/j9+qB94
	+34A/2WPcrPAmjuWhAT86gePFaTxZM2ARgeG+qyQElqipjzyB6w/I6MW5DGzXO8oYe6p9c
	e48CUFNJzUm25yYLHmmoCfaxKRLJ+sk=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-192-Bc0eeR0VPYmgs7ZLY15s7w-1; Sat,
 09 Mar 2024 14:08:37 -0500
X-MC-Unique: Bc0eeR0VPYmgs7ZLY15s7w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF13D1C01505;
	Sat,  9 Mar 2024 19:08:36 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.12])
	by smtp.corp.redhat.com (Postfix) with ESMTP id F07DD1C060D6;
	Sat,  9 Mar 2024 19:08:35 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Dan Murphy <dmurphy@ti.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Kate Hsuan <hpa@redhat.com>,
	linux-leds@vger.kernel.org
Subject: [RFC 0/2] leds: Add led_mc_set_brightness() and led_mc_trigger_event() functions
Date: Sat,  9 Mar 2024 20:08:33 +0100
Message-ID: <20240309190835.173703-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Hi All,

Here is a patch-series adding led_mc_set_brightness() and
led_mc_trigger_event() functions for changing multi-color LED colors
from inside the kernel.

This is a preparation series for adding a new trigger to
drivers/power/supply/power_supply_leds.c which changes the color
of a RGB LED depending on if the battery is discharging (LED off)
charging (LED red) or full (LED green)

This is marked as RFC since the power_supply_leds.c changes have not
been written yet and as such this is compile-tested only atm.
The main goal of this RFC is to gather review feedback on the
chosen approach in these 2 patches.

Regards,

Hans


Hans de Goede (2):
  leds: core: Add led_mc_set_brightness() function
  leds: trigger: Add led_mc_trigger_event() function

 drivers/leds/led-class-multicolor.c |  1 +
 drivers/leds/led-core.c             | 31 +++++++++++++++++++++++++++++
 drivers/leds/led-triggers.c         | 20 +++++++++++++++++++
 include/linux/leds.h                | 26 ++++++++++++++++++++++++
 4 files changed, 78 insertions(+)

-- 
2.43.2


