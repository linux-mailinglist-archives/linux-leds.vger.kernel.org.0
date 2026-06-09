Return-Path: <linux-leds+bounces-8541-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ecPkGn9PKGrxBwMAu9opvQ
	(envelope-from <linux-leds+bounces-8541-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 19:38:07 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D3500663030
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 19:38:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=GEJ5jsa8;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8541-lists+linux-leds=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-leds+bounces-8541-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 31F5730237EE
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jun 2026 17:37:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C716348A2BE;
	Tue,  9 Jun 2026 17:37:09 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DEA36F8EA
	for <linux-leds@vger.kernel.org>; Tue,  9 Jun 2026 17:37:08 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781026629; cv=pass; b=U7JK3KD3W7mSH8oVLWh8+RCZL7v3bOWH84Zw0gmPbh0ohnR4wojTY+kNxufGWPXQhu92+bERVgVUevY1AGnsHqMHSRTiV4OI77k5NxDzQZQ/5YMG+sxKDeNnaYoFSETGZJywVdAvCg2CIVmF/VzbXNIdx++UwAXBQhKLiGwKsgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781026629; c=relaxed/simple;
	bh=WwQnMc0DoL6Odn2dnPb+vRGWyyXDUiuPezpgBLyztfc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AJU/LyLlTyrc7kDpnLQH2NN68v2TWXRUhs3nvP27vjWUdarKQc10ayyIUml/doMF5KehCVi6hBi92RDIEFGDG88cp+rD3PIKsSQAR8MOpLYH9xgd7ENM1EvOH/YA2/0QY0NQsvlpCh+tiHDPh/f/l2gmyXq/EZhP0oVjxHUUObw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEJ5jsa8; arc=pass smtp.client-ip=209.85.160.175
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51775f2473aso43896411cf.0
        for <linux-leds@vger.kernel.org>; Tue, 09 Jun 2026 10:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781026627; cv=none;
        d=google.com; s=arc-20240605;
        b=D3ZmZ6o+9izyhBcicc6tcTe52vbrqSyfwk5uWpJH4GZCkPvzcvamF7CML8gZaQYBgF
         8fpEjYeBP2AxbTlTzP6sNFV+mVBhSQN84BEsOooGgtxzcGRoG0s24h1tkvA9gV5ZhAlV
         lsLWtDxtPo5kxv1VYSr4uuR4eIkmX3+jzzdxcvokhn1sCdHuI6IjvI1GLRz/hWG0GZ1K
         l8TozIAiXfMPuPbZmIv/ChinOhKSM2b8QuC1n3JkUovUt5GrFcDxxtnxZUansMc9kXdG
         UmQpdMs0lNXgVuUTGtgn+SGklFXCingMnl0sMdH86FxWU9m6YfCu19ddMzG2HFM0Onx/
         wFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=9KDDipNYWcrEjFrxI86AFmn3VZDk1sL36GNOVFT+UfY=;
        fh=C0ECbmSau73k3iqLP0IeZROP1XREY22U/iGaFVI+dL8=;
        b=RWo+DHF7h0KRhPw9KkK5N9URJfTbmi1ofpy69swvwjUR2zQsUPRsON+W+PFGKke8Td
         bTw0hhzRSSUG9wPLuqNHtQO3gKmkFXzQl/S5RauAlsfq+xWMFH76thdB0IgxEEqT1rBU
         vFX49SCQbAebkCGUzaJ/RiKzp0uk1Iy596NarDHntdx8qqOM0EzuvsPR/8/PtH27MCuw
         DD4nDVey+aFeKnAo3VnAMz96yGB5wf+XhNL1+YiGG8/PVhlL+KetLIZhUsmmTerbGbiW
         85RlHgP9Syu95o5d/t5Q9wPmedy2mqhDKs0VW6mkcgW9ahbWwR56TC10s/8aocEZUc+1
         Mfjw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781026627; x=1781631427; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9KDDipNYWcrEjFrxI86AFmn3VZDk1sL36GNOVFT+UfY=;
        b=GEJ5jsa8fTJPKxxzYe6My8MnI1M+cnIYzX+ojz616XhBZb1+Uv6bx2gnouI6h6yO1i
         cERTFhjeQx4sNF+MQmss3bWBJJwH2klCcIrZ26/iht9kiC1daE363mgbD9a931TsauGy
         OT7grZxzfcjrVAXAUgeXyoGT/rHwjmV+5B/2pBqDUi1tLpsx4jpinWPTcXBSsQAJvNiL
         uF1rW5tKR7VrJgvqSWYDDrIiKyznD0DkrDj9Nckl8Q4ZZd7RWhWLnC4zOPri75rkhKaz
         b+ZKCH2YH1cI41OMlQBjfGgieUEwRFa0zwKulNzbUyBpcHWWJEqt6R9MMgCji/3LWGEr
         fi5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781026627; x=1781631427;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9KDDipNYWcrEjFrxI86AFmn3VZDk1sL36GNOVFT+UfY=;
        b=rCkfgHa4n1JJU31kM6NQ5bcZoNVcKo2P+ySKD55lwg9ZQKPsVGfRSDXnX76MwDpPM7
         Lr43xP5Dai1ZaEvPEdD4G3mXCrRLP477T8Jw88KWeM54ojo2bmKQEeFboWA5nelol9g3
         hfX8OEIrdiudjGewEpByjKIBHnJrqpWTTkepVW5d0VPx46U0fJ/+QG1UHlIsw5znhYXi
         SLJS4/rTksa8A9Z/LympuC5N3+Mf1BlMFDnl8SUkcr7B9s4dF+7wbey9cxkL+t3rl5fP
         egYEzT3taZN+siZCOWdXOd/FwScmcg+5kygRh/LXQRqrJTcPK0wOvmlAORwRXtVUgp89
         242A==
X-Gm-Message-State: AOJu0YxtdUhe9tgMxuNHoF1U6flo8SGKN8kPPZvQdasEY5DBgXlA2c/u
	Zq2Bt0DRnP7+DkPNaGMLDc4VA3BnubxpLYpaRUNhx5o3dilZ5z4aoEvwh5gZgajwSidg4whSOhk
	B/3V1K+Y5SXAXhZO8Ju2X2ZsXZxNxJew=
X-Gm-Gg: Acq92OHzNzbYh94VXHIH99ep7WZ2XILab3aqolNcwG8bUhcAlZ11VTk3Kfhv47WnOl2
	o8LqTuXnfJYgJaNmHLGCcl6APx1CNu2R/HWJZ/Ex6Vc8aHHtZVuUg5fedhC4VDlXlZL6AKQmiDt
	RhRLwrBdcJgrlIyoRpF8//HSWAcy3KXz/P2Xc841R++o6PU2wzfRfVtM6Xxp/LoB0jW4mjGm+DM
	r9FbeceV4WVaELjbo/9lDH3a0dOU2m82h9xvwiSXV4DZJgSbX6NbTLddBJy/jeg1aW1Nq8SmszS
	lERFdxhRT2IgpYaGOUEwo8JQi7JOHA0FcSUYcFm3TyXB6ycpVo/E0CVK4vZAzw==
X-Received: by 2002:a05:622a:1f10:b0:517:812c:ae29 with SMTP id
 d75a77b69052e-51795b84d81mr290133731cf.53.1781026627268; Tue, 09 Jun 2026
 10:37:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lorenzo Egidio <lorenzoegidioms@gmail.com>
Date: Tue, 9 Jun 2026 14:40:12 -0300
X-Gm-Features: AVVi8CcmBUPOEzGggR18uAaMxG814GsYBSjhlVFzw7vehqX-VXPrBPDYssGZB-I
Message-ID: <CAFxreVGVdXkp2qLGHD30TOxVMCL5RvDaT9A1jmkz_wi5Cab7-A@mail.gmail.com>
Subject: [PATCH] leds: tests: clarify name conflict test
To: lee@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: multipart/mixed; boundary="00000000000074595c0653d59381"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8541-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:linux-leds@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[lorenzoegidioms@gmail.com,linux-leds@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lorenzoegidioms@gmail.com,linux-leds@vger.kernel.org];
	HAS_ATTACHMENT(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-leds];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D3500663030

--00000000000074595c0653d59381
Content-Type: text/plain; charset="UTF-8"

Hi

I noticed that theLED_REJECT_NAME_CONFLICT test in the review of LED
KUnit tests re-registers an already registeredled_classdev instance.

This patch replaces the old led_classdev instance with a new one for
the conflictrejection test, so the test case clearly and explicitly
deals withname-conflict handling.

Besides it, struct led_lookup_data is cleared to zero.

Patch for your consideration is attached.

Best wishes

Lorenzo Egidio

--00000000000074595c0653d59381
Content-Type: application/octet-stream; 
	name="0001-leds-tests-clarify-name-conflict-test.patch"
Content-Disposition: attachment; 
	filename="0001-leds-tests-clarify-name-conflict-test.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_mq6xbw3p0>
X-Attachment-Id: f_mq6xbw3p0

RnJvbSBjZDc0OTkxOGI5MTcwMjE0ZTkxZTIxNTI0MDk1Mzg4ZDdjMGRmMzY0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBMb3JlbnpvIEVnaWRpbyA8bG9yZW56b2VnaWRpb21zQGdtYWls
LmNvbT4KRGF0ZTogVHVlLCA5IEp1biAyMDI2IDE0OjEwOjMxIC0wMzAwClN1YmplY3Q6IFtQQVRD
SF0gbGVkczogdGVzdHM6IGNsYXJpZnkgbmFtZSBjb25mbGljdCB0ZXN0IEl0IGlzIGEgZ29vZCBw
cmFjdGljZQogdG8gdXNlIGEgZnJlc2ggbGVkX2NsYXNzZGV2IGluc3RhbmNlIHdoZW4gZG9pbmcg
dGhlIHRlc3RpbmcuCiBMRURfUkVKRUNUX05BTUVfQ09ORkxJQ1QgcmF0aGVyIHRoYW4gcmUtcmVn
aXN0ZXJpbmcgdGhlIGFscmVhZHkgcmVnaXN0ZXJlZAogTEVEIGNsYXNzIGRldmljZS4gQmVzaWRl
cyB0aGF0LCBkbyBhIHplcm8gaW5pdGlhbGl6YXRpb24gb2YgbGVkX2xvb2t1cF9kYXRhLgoKU2ln
bmVkLW9mZi1ieTogTG9yZW56byBFZ2lkaW8gPGxvcmVuem9lZ2lkaW9tc0BnbWFpbC5jb20+Ci0t
LQogZHJpdmVycy9sZWRzL2xlZC10ZXN0LmMgfCAxMDIgKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyksIDM2IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbGVkcy9sZWQtdGVzdC5jIGIvZHJpdmVy
cy9sZWRzL2xlZC10ZXN0LmMKaW5kZXggZGRmOWFhOTY3Li4zNmFlZjNlMTMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvbGVkcy9sZWQtdGVzdC5jCisrKyBiL2RyaXZlcnMvbGVkcy9sZWQtdGVzdC5jCkBA
IC0xLDQgKzEsNSBAQAogLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQor
Ly8gbGVkczogdGVzdHM6IGNsYXJpZnkgbmFtZSBjb25mbGljdCB0ZXN0CiAvKgogICogQ29weXJp
Z2h0IChDKSAyMDI1IEdvb2dsZSBMTEMKICAqCkBAIC0xMCw3NyArMTEsMTA2IEBACiAjaW5jbHVk
ZSA8bGludXgvZGV2aWNlLmg+CiAjaW5jbHVkZSA8bGludXgvbGVkcy5oPgogCi0jZGVmaW5lIExF
RF9URVNUX1BPU1RfUkVHX0JSSUdIVE5FU1MgMTAKK2VudW0geworCUxFRF9URVNUX1BPU1RfUkVH
X0JSSUdIVE5FU1MgPSAxMCwKK307CiAKLXN0cnVjdCBsZWRfdGVzdF9kZGF0YSB7CitzdHJ1Y3Qg
bGVkX3Rlc3RfZGF0YSB7CiAJc3RydWN0IGxlZF9jbGFzc2RldiBjZGV2OwogCXN0cnVjdCBkZXZp
Y2UgKmRldjsKIH07CiAKLXN0YXRpYyBlbnVtIGxlZF9icmlnaHRuZXNzIGxlZF90ZXN0X2JyaWdo
dG5lc3NfZ2V0KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmNkZXYpCitzdGF0aWMgZW51bSBsZWRfYnJp
Z2h0bmVzcworbGVkX3Rlc3RfYnJpZ2h0bmVzc19nZXQoc3RydWN0IGxlZF9jbGFzc2RldiAqY2Rl
dikKIHsKIAlyZXR1cm4gTEVEX1RFU1RfUE9TVF9SRUdfQlJJR0hUTkVTUzsKIH0KIAotc3RhdGlj
IHZvaWQgbGVkX3Rlc3RfY2xhc3NfcmVnaXN0ZXIoc3RydWN0IGt1bml0ICp0ZXN0KQorc3RhdGlj
IHZvaWQgbGVkX3Rlc3RfaW5pdF9jZGV2KHN0cnVjdCBsZWRfY2xhc3NkZXYgKmNkZXYpCiB7Ci0J
c3RydWN0IGxlZF90ZXN0X2RkYXRhICpkZGF0YSA9IHRlc3QtPnByaXY7Ci0Jc3RydWN0IGxlZF9j
bGFzc2RldiAqY2Rldl9jbGFzaCwgKmNkZXYgPSAmZGRhdGEtPmNkZXY7Ci0Jc3RydWN0IGRldmlj
ZSAqZGV2ID0gZGRhdGEtPmRldjsKLQlpbnQgcmV0OworCW1lbXNldChjZGV2LCAwLCBzaXplb2Yo
KmNkZXYpKTsKIAotCS8qIFJlZ2lzdGVyIGEgTEVEIGNsYXNzIGRldmljZSAqLwogCWNkZXYtPm5h
bWUgPSAibGVkLXRlc3QiOwotCWNkZXYtPmJyaWdodG5lc3NfZ2V0ID0gbGVkX3Rlc3RfYnJpZ2h0
bmVzc19nZXQ7CiAJY2Rldi0+YnJpZ2h0bmVzcyA9IDA7CisJY2Rldi0+YnJpZ2h0bmVzc19nZXQg
PSBsZWRfdGVzdF9icmlnaHRuZXNzX2dldDsKK30KKworc3RhdGljIHZvaWQgbGVkX3Rlc3RfY2xh
c3NfcmVnaXN0ZXIoc3RydWN0IGt1bml0ICp0ZXN0KQoreworCXN0cnVjdCBsZWRfdGVzdF9kYXRh
ICpkYXRhID0gdGVzdC0+cHJpdjsKKwlzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpjZGV2ID0gJmRhdGEt
PmNkZXY7CisJc3RydWN0IGxlZF9jbGFzc2RldiAqY2Rldl9jbGFzaDsKKwlzdHJ1Y3QgbGVkX2Ns
YXNzZGV2ICpjZGV2X3JlamVjdDsKKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBkYXRhLT5kZXY7CisJ
aW50IHJldDsKKworCWxlZF90ZXN0X2luaXRfY2RldihjZGV2KTsKIAogCXJldCA9IGRldm1fbGVk
X2NsYXNzZGV2X3JlZ2lzdGVyKGRldiwgY2Rldik7CiAJS1VOSVRfQVNTRVJUX0VRKHRlc3QsIHJl
dCwgMCk7CiAKKwlLVU5JVF9FWFBFQ1RfTk9UX05VTEwodGVzdCwgY2Rldi0+ZGV2KTsKIAlLVU5J
VF9FWFBFQ1RfRVEodGVzdCwgY2Rldi0+bWF4X2JyaWdodG5lc3MsIExFRF9GVUxMKTsKLQlLVU5J
VF9FWFBFQ1RfRVEodGVzdCwgY2Rldi0+YnJpZ2h0bmVzcywgTEVEX1RFU1RfUE9TVF9SRUdfQlJJ
R0hUTkVTUyk7CisJS1VOSVRfRVhQRUNUX0VRKHRlc3QsIGNkZXYtPmJyaWdodG5lc3MsCisJCQlM
RURfVEVTVF9QT1NUX1JFR19CUklHSFRORVNTKTsKIAlLVU5JVF9FWFBFQ1RfU1RSRVEodGVzdCwg
Y2Rldi0+ZGV2LT5rb2JqLm5hbWUsICJsZWQtdGVzdCIpOwogCi0JLyogUmVnaXN0ZXIgYWdhaW4g
d2l0aCB0aGUgc2FtZSBuYW1lIC0gZXhwZWN0IGl0IHRvIHBhc3Mgd2l0aCB0aGUgTEVEIHJlbmFt
ZWQgKi8KKwkvKgorCSAqIE5hbWUgY29sbGlzaW9uIHNob3VsZCBiZSByZXNvbHZlZCBhdXRvbWF0
aWNhbGx5IGJ5CisJICogcmVuYW1pbmcgdGhlIGRldmljZSBpbnN0YW5jZSB3aGlsZSBwcmVzZXJ2
aW5nIHRoZQorCSAqIGxvZ2ljYWwgTEVEIG5hbWUuCisJICovCiAJY2Rldl9jbGFzaCA9IGRldm1f
a21lbWR1cChkZXYsIGNkZXYsIHNpemVvZigqY2RldiksIEdGUF9LRVJORUwpOwogCUtVTklUX0FT
U0VSVF9OT1RfRVJSX09SX05VTEwodGVzdCwgY2Rldl9jbGFzaCk7CiAKIAlyZXQgPSBkZXZtX2xl
ZF9jbGFzc2Rldl9yZWdpc3RlcihkZXYsIGNkZXZfY2xhc2gpOwogCUtVTklUX0FTU0VSVF9FUSh0
ZXN0LCByZXQsIDApOwogCi0JS1VOSVRfRVhQRUNUX1NUUkVRKHRlc3QsIGNkZXZfY2xhc2gtPmRl
di0+a29iai5uYW1lLCAibGVkLXRlc3RfMSIpOwotCUtVTklUX0VYUEVDVF9TVFJFUSh0ZXN0LCBj
ZGV2X2NsYXNoLT5uYW1lLCAibGVkLXRlc3QiKTsKKwlLVU5JVF9FWFBFQ1RfU1RSRVEodGVzdCwK
KwkJCSAgIGNkZXZfY2xhc2gtPmRldi0+a29iai5uYW1lLAorCQkJICAgImxlZC10ZXN0XzEiKTsK
KwlLVU5JVF9FWFBFQ1RfU1RSRVEodGVzdCwKKwkJCSAgIGNkZXZfY2xhc2gtPm5hbWUsCisJCQkg
ICAibGVkLXRlc3QiKTsKIAotCS8qIEVuYWJsZSBuYW1lIGNvbmZsaWN0IHJlamVjdGlvbiBhbmQg
cmVnaXN0ZXIgd2l0aCB0aGUgc2FtZSBuYW1lIGFnYWluIC0gZXhwZWN0IGZhaWx1cmUgKi8KLQlj
ZGV2X2NsYXNoLT5mbGFncyB8PSBMRURfUkVKRUNUX05BTUVfQ09ORkxJQ1Q7Ci0JcmV0ID0gZGV2
bV9sZWRfY2xhc3NkZXZfcmVnaXN0ZXIoZGV2LCBjZGV2X2NsYXNoKTsKKwkvKgorCSAqIFZlcmlm
eSB0aGF0IGV4cGxpY2l0IGNvbmZsaWN0IHJlamVjdGlvbiBmYWlscy4KKwkgKi8KKwljZGV2X3Jl
amVjdCA9IGRldm1fa21lbWR1cChkZXYsIGNkZXYsIHNpemVvZigqY2RldiksIEdGUF9LRVJORUwp
OworCUtVTklUX0FTU0VSVF9OT1RfRVJSX09SX05VTEwodGVzdCwgY2Rldl9yZWplY3QpOworCisJ
Y2Rldl9yZWplY3QtPmZsYWdzIHw9IExFRF9SRUpFQ1RfTkFNRV9DT05GTElDVDsKKworCXJldCA9
IGRldm1fbGVkX2NsYXNzZGV2X3JlZ2lzdGVyKGRldiwgY2Rldl9yZWplY3QpOwogCUtVTklUX0VY
UEVDVF9FUSh0ZXN0LCByZXQsIC1FRVhJU1QpOwogfQogCiBzdGF0aWMgdm9pZCBsZWRfdGVzdF9j
bGFzc19hZGRfbG9va3VwX2FuZF9nZXQoc3RydWN0IGt1bml0ICp0ZXN0KQogewotCXN0cnVjdCBs
ZWRfdGVzdF9kZGF0YSAqZGRhdGEgPSB0ZXN0LT5wcml2OwotCXN0cnVjdCBsZWRfY2xhc3NkZXYg
KmNkZXYgPSAmZGRhdGEtPmNkZXYsICpjZGV2X2dldDsKLQlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBk
ZGF0YS0+ZGV2OwotCXN0cnVjdCBsZWRfbG9va3VwX2RhdGEgbG9va3VwOworCXN0cnVjdCBsZWRf
dGVzdF9kYXRhICpkYXRhID0gdGVzdC0+cHJpdjsKKwlzdHJ1Y3QgbGVkX2NsYXNzZGV2ICpjZGV2
ID0gJmRhdGEtPmNkZXY7CisJc3RydWN0IGxlZF9jbGFzc2RldiAqY2Rldl9nZXQ7CisJc3RydWN0
IGRldmljZSAqZGV2ID0gZGF0YS0+ZGV2OworCXN0cnVjdCBsZWRfbG9va3VwX2RhdGEgbG9va3Vw
ID0geyB9OwogCWludCByZXQ7CiAKLQkvKiBGaXJzdCwgcmVnaXN0ZXIgYSBMRUQgY2xhc3MgZGV2
aWNlICovCi0JY2Rldi0+bmFtZSA9ICJsZWQtdGVzdCI7CisJbGVkX3Rlc3RfaW5pdF9jZGV2KGNk
ZXYpOworCiAJcmV0ID0gZGV2bV9sZWRfY2xhc3NkZXZfcmVnaXN0ZXIoZGV2LCBjZGV2KTsKIAlL
VU5JVF9BU1NFUlRfRVEodGVzdCwgcmV0LCAwKTsKIAotCS8qIFRoZW4gbWFrZSB0aGUgTEVEIGF2
YWlsYWJsZSBmb3IgbG9va3VwICovCiAJbG9va3VwLnByb3ZpZGVyID0gY2Rldi0+bmFtZTsKIAls
b29rdXAuZGV2X2lkID0gZGV2X25hbWUoZGV2KTsKIAlsb29rdXAuY29uX2lkID0gImxlZC10ZXN0
LTEiOworCiAJbGVkX2FkZF9sb29rdXAoJmxvb2t1cCk7CiAKLQkvKiBGaW5hbGx5LCBhdHRlbXB0
IHRvIGxvb2sgaXQgdXAgdmlhIHRoZSBBUEkgLSBpbWFnaW5lIHRoaXMgd2FzIGFuIG9ydGhvZ29u
YWwgZHJpdmVyICovCiAJY2Rldl9nZXQgPSBkZXZtX2xlZF9nZXQoZGV2LCAibGVkLXRlc3QtMSIp
OwotCUtVTklUX0FTU0VSVF9GQUxTRSh0ZXN0LCBJU19FUlIoY2Rldl9nZXQpKTsKKwlLVU5JVF9B
U1NFUlRfTk9UX0VSUl9PUl9OVUxMKHRlc3QsIGNkZXZfZ2V0KTsKIAotCUtVTklUX0VYUEVDVF9T
VFJFUSh0ZXN0LCBjZGV2X2dldC0+bmFtZSwgY2Rldi0+bmFtZSk7CisJS1VOSVRfRVhQRUNUX1NU
UkVRKHRlc3QsCisJCQkgICBjZGV2X2dldC0+bmFtZSwKKwkJCSAgIGNkZXYtPm5hbWUpOwogCiAJ
bGVkX3JlbW92ZV9sb29rdXAoJmxvb2t1cCk7CiB9CkBAIC05MywzMCArMTIzLDI5IEBAIHN0YXRp
YyBzdHJ1Y3Qga3VuaXRfY2FzZSBsZWRfdGVzdF9jYXNlc1tdID0gewogCiBzdGF0aWMgaW50IGxl
ZF90ZXN0X2luaXQoc3RydWN0IGt1bml0ICp0ZXN0KQogewotCXN0cnVjdCBsZWRfdGVzdF9kZGF0
YSAqZGRhdGE7CisJc3RydWN0IGxlZF90ZXN0X2RhdGEgKmRhdGE7CiAJc3RydWN0IGRldmljZSAq
ZGV2OwogCi0JZGRhdGEgPSBrdW5pdF9remFsbG9jKHRlc3QsIHNpemVvZigqZGRhdGEpLCBHRlBf
S0VSTkVMKTsKLQlpZiAoIWRkYXRhKQorCWRhdGEgPSBrdW5pdF9remFsbG9jKHRlc3QsIHNpemVv
ZigqZGF0YSksIEdGUF9LRVJORUwpOworCWlmICghZGF0YSkKIAkJcmV0dXJuIC1FTk9NRU07CiAK
LQl0ZXN0LT5wcml2ID0gZGRhdGE7Ci0KIAlkZXYgPSBrdW5pdF9kZXZpY2VfcmVnaXN0ZXIodGVz
dCwgImxlZF90ZXN0Iik7CiAJaWYgKElTX0VSUihkZXYpKQogCQlyZXR1cm4gUFRSX0VSUihkZXYp
OwogCi0JZGRhdGEtPmRldiA9IGdldF9kZXZpY2UoZGV2KTsKKwlkYXRhLT5kZXYgPSBnZXRfZGV2
aWNlKGRldik7CisJdGVzdC0+cHJpdiA9IGRhdGE7CiAKIAlyZXR1cm4gMDsKIH0KIAogc3RhdGlj
IHZvaWQgbGVkX3Rlc3RfZXhpdChzdHJ1Y3Qga3VuaXQgKnRlc3QpCiB7Ci0Jc3RydWN0IGxlZF90
ZXN0X2RkYXRhICpkZGF0YSA9IHRlc3QtPnByaXY7CisJc3RydWN0IGxlZF90ZXN0X2RhdGEgKmRh
dGEgPSB0ZXN0LT5wcml2OwogCi0JaWYgKGRkYXRhICYmIGRkYXRhLT5kZXYpCi0JCXB1dF9kZXZp
Y2UoZGRhdGEtPmRldik7CisJaWYgKGRhdGEgJiYgZGF0YS0+ZGV2KQorCQlwdXRfZGV2aWNlKGRh
dGEtPmRldik7CiB9CiAKIHN0YXRpYyBzdHJ1Y3Qga3VuaXRfc3VpdGUgbGVkX3Rlc3Rfc3VpdGUg
PSB7CkBAIC0xMjUsNiArMTU0LDcgQEAgc3RhdGljIHN0cnVjdCBrdW5pdF9zdWl0ZSBsZWRfdGVz
dF9zdWl0ZSA9IHsKIAkuZXhpdCA9IGxlZF90ZXN0X2V4aXQsCiAJLnRlc3RfY2FzZXMgPSBsZWRf
dGVzdF9jYXNlcywKIH07CisKIGt1bml0X3Rlc3Rfc3VpdGUobGVkX3Rlc3Rfc3VpdGUpOwogCiBN
T0RVTEVfQVVUSE9SKCJMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPiIpOwotLSAKMi41MC4xCgo=
--00000000000074595c0653d59381--

