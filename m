Return-Path: <linux-leds+bounces-5524-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E07B5A36B
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 22:44:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 84F3A3A2868
	for <lists+linux-leds@lfdr.de>; Tue, 16 Sep 2025 20:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EC361D88A4;
	Tue, 16 Sep 2025 20:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="L685cjSE"
X-Original-To: linux-leds@vger.kernel.org
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744E727978C
	for <linux-leds@vger.kernel.org>; Tue, 16 Sep 2025 20:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758055472; cv=none; b=nAC0ZiiUOmIobaiNZNxWaY61teeYSSqDS6pVLm/yW4AKkc0Nnxxliq7BKXHlAl7vVGefSxs1PTOxPg/ahYxnxSzyRPHvx639XPTBYVpvotLtOZSJcUee7IGNKFwJdH9h5ihTlBlWesfBkL6S3L9D3CC8USlgLXLsb5hN+sNLfd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758055472; c=relaxed/simple;
	bh=abFoxMtLauzrFV3UKUvfxYAPkbAVH7kNr2p/oU7/iuE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkuujKUKWGns4YRN6u9ZzPvvSkOEdFYFf7zU3Ed9EUHqO++y0n+3SXFVb+HMYu5lQpSd9osojAGIFEMPSNSftuYl6eoAXIIVSEk6/bxLe4uTWMrkD5lqWo0eRSvtf3+f1ANpYXhmo0BqIHfG9aVgtgQSfTZW6Q7T0wKyXqumVak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=L685cjSE; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Date: Tue, 16 Sep 2025 14:44:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1758055466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dN0xDP/ZkpRjz7TmmnrgrlzSzqBgLRMnlsuymGhNbpM=;
	b=L685cjSEAZN4jtn9oLvRIxccdDjVpK0W3BYbPL/lZINHampr0KyqXlqkeibsGg2Wua4522
	SIAxXaEzrHKGeRVEna5A9LeRZABz/L0KCjFx33JDzN5Bx36flgablWeLhqf5R0ujSOzQpY
	TSIB+DlPB/QucUp+66XY00+19pw3ChE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Russ Weight <russ.weight@linux.dev>
To: Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: "Lalaev, Andrei" <andrei.lalaev@anton-paar.com>, 
	"rafael@kernel.org" <rafael@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, 
	"dakr@kernel.org" <dakr@kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>
Subject: Re: use-after-free in firmware_fallback_sysfs
Message-ID: <mosaqral3owgsu3raxo4lbvbfp3h3snqlxkaps2qbprp2vuljt@2ouxmsxkk4el>
References: <AS8PR03MB690125FD99DEC3AF5887AE0DC800A@AS8PR03MB6901.eurprd03.prod.outlook.com>
 <uotbao55xzmqx6rjzfxq63fzow5nesyqy7gb3illrgkwxrhvee@2wzvsghvk2qe>
 <58758ff1-e7d7-4c47-a513-f65bdf777a6a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58758ff1-e7d7-4c47-a513-f65bdf777a6a@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Fri, Sep 12, 2025 at 12:13:30PM +0200, Andrei Lalaev wrote:
> On 12.09.2025 00:35, Russ Weight wrote:
> > 
> > On Thu, Sep 04, 2025 at 04:58:45AM +0000, Lalaev, Andrei wrote:
> >> Hi,
> >>
> >> We performed a long-term stability test on the LP5562 driver by repeatedly
> >> downloading different LED firmwares using sysfs interface.
> >> And after some time, we see the following "use-after-free" trace on kernel 6.12.11:
> >>
> >> [  274.759115] BUG: KASAN: slab-use-after-free in firmware_fallback_sysfs (include/linux/list.h:153 include/linux/list.h:169 drivers/base/firmware_loader/fallback.c:98 drivers/base/firmware_loader/fallback.c:162 drivers/base/firmware_loader/fallback.c:238)
> >> [  274.766743] Write of size 4 at addr b31d0850 by task kworker/2:2/137
> >> [  274.774680] CPU: 2 UID: 0 PID: 137 Comm: kworker/2:2 Tainted: G         C         6.12.11 #1
> >> [  274.783208] Tainted: [C]=CRAP
> >> [  274.786215] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> >> [  274.792775] Workqueue: events request_firmware_work_func
> >> [  274.798151] Call trace:
> >> [  274.800720] dump_backtrace from show_stack (arch/arm/kernel/traps.c:259)
> >> [  274.805827]  r7:600f0093 r6:600f0093 r5:b19659b4 r4:00000000
> >> [  274.811510] show_stack from dump_stack_lvl (lib/dump_stack.c:122)
> >> [  274.816613] dump_stack_lvl from print_report (mm/kasan/report.c:378 mm/kasan/report.c:488)
> >> [  274.822073]  r7:000031d0 r6:df7dba00 r5:f13bbb20 r4:b31d0850
> >> [  274.827755] print_report from kasan_report (mm/kasan/report.c:603)
> >> [  274.832885]  r10:b2d56c20 r9:cdc89808 r8:00003a98 r7:b0f653ac r6:00000004 r5:00000001
> >> [  274.840744]  r4:b31d0850
> >> [  274.843298] kasan_report from __asan_report_store4_noabort (mm/kasan/report_generic.c:385)
> >> [  274.849804]  r7:b9f72c00 r6:cdc89800 r5:b5d31e00 r4:b5d31e10
> >> [  274.855488] __asan_report_store4_noabort from firmware_fallback_sysfs (include/linux/list.h:153 include/linux/list.h:169 drivers/base/firmware_loader/fallback.c:98 drivers/base/firmware_loader/fallback.c:162 drivers/base/firmware_loader/fallback.c:238)
> >> [  274.863105] firmware_fallback_sysfs from _request_firmware (drivers/base/firmware_loader/main.c:941)
> >> [  274.869862]  r10:f13bbda0 r9:b9f72c80 r8:b19c73d8 r7:00000004 r6:00000000 r5:b5d31e00
> >> [  274.877718]  r4:f13bbd00
> >> [  274.880273] _request_firmware from request_firmware_work_func (drivers/base/firmware_loader/main.c:1196)
> >> [  274.887226]  r10:b9f72e98 r9:b9f72e94 r8:f13bbde0 r7:173ee5d3 r6:00000000 r5:ad2777b0
> >> [  274.895097]  r4:b9f72e80
> >> [  274.897661] request_firmware_work_func from process_one_work (kernel/workqueue.c:3235)
> >> [  274.904613]  r10:00000000 r9:b7d7e1e0 r8:b7d7dd80 r7:d76b53c0 r6:b2013c00 r5:b9f72e80
> >> [  274.912469]  r4:b2371a00
> >> [  274.915024] process_one_work from worker_thread (kernel/workqueue.c:3304 (discriminator 2) kernel/workqueue.c:3391 (discriminator 2))
> >> [  274.920823]  r10:b2371a2c r9:b2371a00 r8:b9f72e84 r7:b2371a2c r6:d76b53dc r5:a546e345
> >> [  274.928678]  r4:00000007
> >> [  274.931234] worker_thread from kthread (kernel/kthread.c:389)
> >> [  274.936179]  r10:f0933ca0 r9:b2371a00 r8:b7f6b800 r7:b019ad18 r6:b2354880 r5:b7d7dd80
> >> [  274.944035]  r4:b2354d00
> >> [  274.946592] kthread from ret_from_fork (arch/arm/kernel/entry-common.S:138)
> >> [  274.951350] Exception stack(0xf13bbfb0 to 0xf13bbff8)
> >> [  274.956435] bfa0:                                     00000000 00000000 00000000 00000000
> >> [  274.964647] bfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> >> [  274.972858] bfe0: 00000000 00000000 00000000 00000000 00000013 00000000
> >> [  274.979508]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:b01ba280
> >> [  274.987365]  r4:b2354d00 r3:00000000
> >>
> >> [  274.992472] Allocated by task 8 on cpu 0 at 273.209883s:
> >> [  274.997814] kasan_save_track (mm/kasan/common.c:48 mm/kasan/common.c:68)
> >> [  274.997858] kasan_save_alloc_info (mm/kasan/generic.c:566)
> >> [  274.997892] __kasan_kmalloc (mm/kasan/common.c:398)
> >> [  274.997926] __kmalloc_cache_noprof (mm/slub.c:4319)
> >> [  274.997957] alloc_lookup_fw_priv (drivers/base/firmware_loader/main.c:131 drivers/base/firmware_loader/main.c:190)
> >> [  274.997993] _request_firmware (drivers/base/firmware_loader/main.c:769 drivers/base/firmware_loader/main.c:899)
> >> [  274.998023] request_firmware_work_func (drivers/base/firmware_loader/main.c:1196)
> >> [  274.998055] process_one_work (kernel/workqueue.c:3235)
> >> [  274.998084] worker_thread (kernel/workqueue.c:3304 (discriminator 2) kernel/workqueue.c:3391 (discriminator 2))
> >> [  274.998112] kthread (kernel/kthread.c:389)
> >> [  274.998149] ret_from_fork (arch/arm/kernel/entry-common.S:138)
> >>
> >> [  274.999686] Freed by task 8 on cpu 0 at 273.230581s:
> >> [  275.004679] kasan_save_track (mm/kasan/common.c:48 mm/kasan/common.c:68)
> >> [  275.004718] kasan_save_free_info (mm/kasan/generic.c:582 (discriminator 1))
> >> [  275.004747] __kasan_slab_free (mm/kasan/common.c:271)
> >> [  275.004782] kfree (mm/slub.c:4601 (discriminator 3) mm/slub.c:4749 (discriminator 3))
> >> [  275.004810] free_fw_priv (drivers/base/firmware_loader/main.c:231)
> >> [  275.004840] release_firmware (drivers/base/firmware_loader/main.c:604 drivers/base/firmware_loader/main.c:1170 drivers/base/firmware_loader/main.c:1166)
> >> [  275.004871] lp55xx_firmware_loaded (drivers/leds/leds-lp55xx-common.c:549) leds_lp55xx_common
> >> [  275.005074] request_firmware_work_func (drivers/base/firmware_loader/main.c:1197)
> >> [  275.005112] process_one_work (kernel/workqueue.c:3235)
> >> [  275.005145] worker_thread (kernel/workqueue.c:3304 (discriminator 2) kernel/workqueue.c:3391 (discriminator 2))
> >> [  275.005174] kthread (kernel/kthread.c:389)
> >> [  275.005212] ret_from_fork (arch/arm/kernel/entry-common.S:138)
> >> [  275.006754] The buggy address belongs to the object at b31d0800 which belongs to the cache kmalloc-128 of size 128
> >> [  275.018610] The buggy address is located 80 bytes inside of freed 128-byte region [b31d0800, b31d0880)
> >> [  275.030938] The buggy address belongs to the physical page:
> >> [  275.036533] page: refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x131d0
> >> [  275.036568] flags: 0x0(zone=0)
> >> [  275.036598] page_type: f5(slab)
> >> [  275.036634] raw: 00000000 b2001400 df9544e0 00000002 00000000 00100010 f5000000 00000001
> >> [  275.036659] page dumped because: kasan: bad access detected
> >>
> >> [  275.038189] Memory state around the buggy address:
> >> [  275.043008]  b31d0700: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >> [  275.049563]  b31d0780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >> [  275.056120] >b31d0800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> >> [  275.062669]                                          ^
> >> [  275.067831]  b31d0880: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
> >> [  275.074386]  b31d0900: 00 00 00 00 00 00 00 00 00 00 fc fc fc fc fc fc
> >> [  275.080938] ==================================================================
> >>
> >> I couldn't find any related patches to fix this issue in upstream, so
> >> I have made the following patch to address this issue, but I have some concerns about it.
> >>
> >> Could someone please provide feedback or insights on this?
> >>
> >> ----
> >>  drivers/base/firmware_loader/main.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
> >> index c6664a787..1a49022f4 100644
> >> --- a/drivers/base/firmware_loader/main.c
> >> +++ b/drivers/base/firmware_loader/main.c
> >> @@ -211,6 +211,7 @@ static void __free_fw_priv(struct kref *ref)
> >>  		 (unsigned int)fw_priv->size);
> >>  
> >>  	list_del(&fw_priv->list);
> >> +	list_del(&fw_priv->pending_list);
> > 
> > References to &fw_priv->pending_list in this context would need to
> > be bounded with "#ifdef CONFIG_FW_LOADER_USER_HELPER".
> > 
> > Have you repeated your long-term stability test with this change?
> > 
> 
> Hi Russ,
> 
> Yes, sure. I had the test running for 2 days, and no "use-after-free" appeared.
> 

Hi Andrei,

Have you looked at the firmware fallback selftests?  These are at 
tools/testing/selftests/firmware/fw_fallback.sh. I'm wondering if
these tests could be modified to expose the bug that you found. Can
you take a look?

Thanks,
- Russ

