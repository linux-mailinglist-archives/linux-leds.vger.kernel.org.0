Return-Path: <linux-leds+bounces-8198-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +C4hK7AnC2pAEAUAu9opvQ
	(envelope-from <linux-leds+bounces-8198-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 16:52:32 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5747356F448
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 16:52:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5B233001026
	for <lists+linux-leds@lfdr.de>; Mon, 18 May 2026 14:51:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858B2272E56;
	Mon, 18 May 2026 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="IpK+n58p"
X-Original-To: linux-leds@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013059.outbound.protection.outlook.com [52.101.72.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69CFE25CC79;
	Mon, 18 May 2026 14:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779115910; cv=fail; b=Qv7QJN2+AhcL82kXMpEflopB9zq4fgARzLTBsZob1NVKEosAfiPNRdp3EgL+IK+0EO8+8iEBhO9+9ISx6L0yczEx0T/QCB2MZjk8v1MgBpejvNGw0ghRTN3rOJA5KQaOI7bNVXeMouj9LX12ahDTwkNuD2LMhEl+esCCgaYagB0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779115910; c=relaxed/simple;
	bh=WwAZwZGdDtYkIpMDP9WeS9mZmEIWjQ8DfHdf/dUh67E=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ei6U3MdUwA9b046RPL+yIPeprRonkqAkOOYt4oinMUOLVwQn+YSoRLaNhQOnLa/gr02gadCEEf5WABfFc1DlvgEWultHE9kHSylnUUWTKjfXDo3PWFkk7Cad05yL+fq93r9+w9LqKyx5UaqXNAHRl+zYrQr30wrd6o/T29qTMII=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=IpK+n58p; arc=fail smtp.client-ip=52.101.72.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h2wOATbIeyNLyxWjX7sdfVBRGTfTX7CK/PNKtcGIajGVzzlGn47yeWpgiGM08U+Y9+Ir2MSkxak6xDNJx+DsTBhRzapXk0iood7P99+IxL7KldXrDxwraqRv77J/gXQ+0hLCSONMvqJTy140VvAzGwJGxvJW9mcSNjO+JbAjgR8CcUz3IZe57ArFpCoLZEShcyeWTKvbI3E4UJbJby1+QUlKzNUZA+TSYPhqbQ+UUWwkoEXYPIAQXO0bk9HOgJI1DU1HVcLNS5r6eofR3P94YrzNTznpECBHble/D4BFsGhMIzs4ZqKyyguDhWjyRuCDZmQf/Rnt7nVkBwmFPL/P1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwAZwZGdDtYkIpMDP9WeS9mZmEIWjQ8DfHdf/dUh67E=;
 b=u0Tnve918DxEevw7b5N51CJ9qpGDas29ul2XmEDhFg1ypPY6FZDPmQ3yiGeNh3M6g9CiqMASkkhSrOgDTnQaWawrMwuWX84CUjGp9xhjDhJVPOEOuzIX1tsbrid9aTQdPdZU+1Pe58T9nufwpmIRftzevGSwZEYY4eeRiPvwL1XjrOHunt/NUFk8Qm3DcWsM5OpKb0B2ZmAnr4PLg1tiO/7curUZX45KRVf2dA49meC2YA27odhPk+tabLIKBf9sibroFOuuD8+ExAogOD3sOWSWILI2WHjUzFRlc1fVSDEOMgJjM5MURPRktwysJvvo6EUcXf2LYHnOgjIV1uTQ9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WwAZwZGdDtYkIpMDP9WeS9mZmEIWjQ8DfHdf/dUh67E=;
 b=IpK+n58pzMdjXIT56I0qm0juVWrTxOspFb6xHEe94+uacGWVXHGqUV7JlCHiXhpifB0KIffgOPUV+p++gVsYrObfbVL2DUnkMGoDcWybvQDy4BC2Qc0BTPdCEqSgq6ACnoY/iM/RFZ/m+OSDG1muoSQbMWtkI8wMub10if56563jAurx8XpcExAnVdF9C0Gorn7KMSOUHdwGJnFOe/u2e9gJxzNYRoLq356sLvo5bmepZiIHsNmtqDEc7kX9ypJAUxkeHoP3QKKjyHkwmMluN2xUmSXFFwVYaP3ghX5OAOJZJqDoDIBwvaGzYxA97POc6WmQgedxhrG7x15X8EwjuQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PA1PR10MB9033.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:452::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Mon, 18 May
 2026 14:51:42 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%6]) with mapi id 15.21.0025.012; Mon, 18 May 2026
 14:51:42 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>
CC: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] leds: Use named initializers for arrays of
 i2c_device_data
Thread-Topic: [PATCH] leds: Use named initializers for arrays of
 i2c_device_data
Thread-Index: AQHc5tXUm6mGByZ0Zkmha6bwAXZ7Tg==
Date: Mon, 18 May 2026 14:51:42 +0000
Message-ID: <7c8cc62e015032717ddd6a55facfb4a32795ed64.camel@siemens.com>
References: <20260515163325.471175-2-u.kleine-koenig@baylibre.com>
In-Reply-To: <20260515163325.471175-2-u.kleine-koenig@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.54.3 (3.54.3-2.fc41) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PA1PR10MB9033:EE_
x-ms-office365-filtering-correlation-id: 0decea7e-0f4e-4899-dc6b-08deb4ecf987
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|22082099003|18002099003|56012099003|38070700021|55112099003|11063799003;
x-microsoft-antispam-message-info:
 +fWRbDwx+TNaLOIYPdJP7gHfpJJ6PmpQCL2m/O9egqPc2LzMfiOGMbJTzuVZ8EH4cB4+9MoOeDn14DDFCqcn/0RC4t1xuUfyr62NSnV6xLyElM+Qcu16bhvfDlwCY4uXAnwSwCLddGnveLdulLv0FWceFRRYvnm2XlHYMBge/cRubpVs7Hd48qC7c1CpVCgRkm0WwviPC9fT6AA1Ta4+sNSwpfmT5g1DTUQTnN8ALNHc264zlYQPEyeVPiAE/keqcSL3Beyu141ssH+yjwKGK+gZrgeAWnPTBi0PaSpz3VVSBUACZoGL2ZzTBR2FymO6rMJeZcgO4XUbNc7ahNC55ipz8C1iSBAP+dqe4ScpPnEcX05WUiPDM1qDsmBW58Ksc6E61h0dlfoVbCNYFqwXt7dgPg7h2tZIH2eIf0ZLMtb2cVG3mjtKkGsGSxdwaoDOr0X5fG1ukqtTI6SyK14xVLTpPHsAHNn58NxLxick82Fp9coiu1VAI9e7B6O4/UqeLOGZh4K/XVj8ekjTg2gDl61str82wlLXXzWzJzEsm5xW1/73RQw58uwhMT2fvXFqpI07nqh/wKmfIitapxd+Uv31XHjk7uG3YvvXsBWuirqPIFnFCBGBxt0b7C7qJuhUNhU/rJNhEhu+be+aCx5be3Vj4Su+gMtdvohiNQ650RfjzZQvy0fdW3ll5va8e4RAWmgh9h3B6TmcBpSHN0wsrg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(22082099003)(18002099003)(56012099003)(38070700021)(55112099003)(11063799003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ODZDMGZwTVpNMlNmV2hKbVV6T3dqcmxoR0doeDhKUnlIcVhBcTJUUGx0RTJE?=
 =?utf-8?B?cUhJTG9sVzVvQ3JyWjBlR1VPZy85alRlbEpRNHgxazU4cHZFM2ZVa2Raekow?=
 =?utf-8?B?alh4YWN3eEtRYnE5c2RkZDM3UFlXK1B6RTBhbk53cElpeHhzTzY0VE1jZUo1?=
 =?utf-8?B?MFlqaDRmWnp0N0hXclhSOFNGWG1kVGNXVTBBOTZjRGMwNGxWak9EYzQremRG?=
 =?utf-8?B?am9sYTR0MmdlelY5bmlVQ3ZxMGZTWDVUUHVxUlBpNC9zc284RkZ1ejNBMWZo?=
 =?utf-8?B?S2NJSkNpVGxxRnBZK25iUjhSamVaOTNvcG1XRHdTb0V3QTdMdTBuQ0FlOUsz?=
 =?utf-8?B?cXlJbVhnbE1pVExUelVNSS81bnI5ZCtrNUhxNVFmK0tYdmJlTFk5U1pBamJO?=
 =?utf-8?B?TEx4OC8wZWtyU1ZINXJaRmNXdGdSaytIYXdEajVRNjM3MzIydjB4dmRUZ1Yx?=
 =?utf-8?B?MXpwZUhTV1dpRmR6STNqbnFWbG5wcUNWbEVmNHlYYTZLMU13blNQSDlHNVVv?=
 =?utf-8?B?L3F1QXFNajNHS3JjclN0ZjEzdnNOOTl4NUxRZmhnR0hIZmlaRjhJME5YVXdT?=
 =?utf-8?B?WjJSc0NuQTdYbnJQdDFJNGpiN253YWZDMFRwMFoyRUtmampkMloxbTlvUjcw?=
 =?utf-8?B?YWVONWRodEF1N0JoeHNCZzh2V0cvdGh2dFJVdllndkFKZ0RudEtMdmR6ejN0?=
 =?utf-8?B?VWowaTFTTTdhazFOS0k5NGN4dVFCZCt3QmpmNFkzMlJhclBWUXR3ZVZvYWFt?=
 =?utf-8?B?R3JsNmdzM01pQzJwRlNNbGNEaWk3eDlNMWg3S1htWkdMdGU3VlBTSTFLRDlx?=
 =?utf-8?B?RlVCbWdOLzh5UmhoYW90eENjOCtCTDFpcDVka2JIcGRHT1R0MDBBZXJRa0Na?=
 =?utf-8?B?aGY5RzlTRCtCbEpNb2VFWHZ2VjlhLzlIWUg2K1dycXJjWUZodVUzSDhPSVNQ?=
 =?utf-8?B?dTZ4MlZ0Sjh5NUk0MTBZbEw5empMRjh0NDFSam1tMFNLeElHQmJLV2p4cjBU?=
 =?utf-8?B?NGhDRFFWY2dMQUtwODVGVTJ5OVN0Y2NlTnlTUHp1MUZVNmU0Ym1BK1hwZEsx?=
 =?utf-8?B?MUVzZ0RjUGZIem9Ja0JaVS9ocThyaFh4ZU1DSUZwaEp1elJzYWVtVmtOTmtt?=
 =?utf-8?B?R3dWbWFvaDRXYktONjJEbnl1eTFUKzRtUlJBSzY4T28zL3JUalNnMGJjdGdQ?=
 =?utf-8?B?TmxEQU5VNlB0T3JPYjU1YnkxMmhnSlZzUGIzNEVTQ2VZRUg5SURIVDdTbWg5?=
 =?utf-8?B?cGp0bWlaYi9LcVZObHkvQk51QVUybXl0a1BwS2owd0hBeElldHRWczAxaWVL?=
 =?utf-8?B?cTErWjdwaWVCdnFxZnViVTN6TjZqMUxLR251dmNVM1VnTkpWMlMwejJQT0lV?=
 =?utf-8?B?a0tpOFI1S3BBeFJ2MnNGOU05Z2hLYjR3UW5lbEV3TkI0NTVuWFJoMUFYMnFW?=
 =?utf-8?B?dlRydEE3QXVhUnJKVkQ0S2JJQndtakZaK2pPRDJBZzBNUEJsV1JwN3lMNTRG?=
 =?utf-8?B?WnU0SWJReG90UHhBa0xBY1d5SGhRMFk3Tm9JZ0t6amxBRll0dk5xMDJ1eEsz?=
 =?utf-8?B?YnBqeHQxdGt4QlNZV1ZnQ3hZRHRTVndnUzFkaHBNZ0FtVnJSMDBRL2xZME5P?=
 =?utf-8?B?b0dGbEFLOVF5N1A4UGZVNzlzcS95OXBUVnYyQVFJY0VicGltMkVCdUZFQVBX?=
 =?utf-8?B?QmtNM3hyb3dNM1FocTdkUkVYZWRQUDBMbGNhZTJQRm5CbUZ6V01SajJZRjFH?=
 =?utf-8?B?VTk1WnlwbHhZVkhRcVFiWUNsNnoreUptUms1TWpWMFgxK0R4OFN5d1BnSjZS?=
 =?utf-8?B?QUUwQzU3ai83QzJUZ2tnVkJwTWxmWlkxTGRUdElXTERaQmdUcGF3K3ptblo3?=
 =?utf-8?B?YW5PWmFKUGNPdUxTRnNhdjdFU1p2QWM5LzhHVnZ2VXhNeVRTQWR4Y2p0Mzky?=
 =?utf-8?B?TVhDdVNJOHRRKzBiSWQwazllOFBkOXM0QzBpSXA4a2pyaG03ZWE2Rk82dHJk?=
 =?utf-8?B?YUYyc214eFJ4TWs3ZDdqRHNuYjQ5Y0drTjVHV2NESEN1SGJuR045VGIrL3d3?=
 =?utf-8?B?M2hmVzdQdC8zL2FKa0VJODl6UFBBU0hpbWlCVjc0anpFNW44SEhKSXlqN2Rz?=
 =?utf-8?B?K2hXUTZvVTlxUnNtWjRHbHJWS0tsVHk2ZXJWdXlhbExJdWVKWlNDRC9peGRw?=
 =?utf-8?B?dGc4dlZ3K0dWTGpuUk9ESHBjdDVTc05EbGNUblJpQWw4RWQ1bGd2TFJqbFRo?=
 =?utf-8?B?RlZwM3NpQzY5cEtJL1VpNHBmR1NucTZCQkRZU3hEc3J3VWtTaG53L0ZsVXZW?=
 =?utf-8?B?MUlNcFptaW1zc3ZYeTQ0RG9vNE5idFRVdlNmUStDSkhFUzFhbHhCK1BtNWdN?=
 =?utf-8?Q?FKNRsz+c47bD71u0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A09A030AABC9A64389B98262396EED68@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0decea7e-0f4e-4899-dc6b-08deb4ecf987
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 May 2026 14:51:42.4193
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zWJSVkMDDrSemuv3gevFofLFVroLRFxpOReViP8EvedWmm2sv0ixlswLMVm/WgsQHBaJ0FB7ck4vBFfvAdKz8JWxGh+kMO6/k+sQTPxOE0k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9033
X-Spamd-Result: default: False [-0.06 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[siemens.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[siemens.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8198-lists,linux-leds=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[siemens.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alexander.sverdlin@siemens.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-leds];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,baylibre.com:email,siemens.com:url,siemens.com:email,siemens.com:mid,siemens.com:dkim]
X-Rspamd-Queue-Id: 5747356F448
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgVXdlLA0KDQpPbiBGcmksIDIwMjYtMDUtMTUgYXQgMTg6MzMgKzAyMDAsIFV3ZSBLbGVpbmUt
S8O2bmlnIChUaGUgQ2FwYWJsZSBIdWIpIHdyb3RlOg0KPiBXaGlsZSBiZWluZyBsZXNzIGNvbXBh
Y3QsIHVzaW5nIG5hbWVkIGluaXRpYWxpemVycyBhbGxvd3MgdG8gbW9yZSBlYXNpbHkNCj4gc2Vl
IHdoaWNoIG1lbWJlcnMgb2YgdGhlIHN0cnVjdHMgYXJlIGFzc2lnbmVkIHdoaWNoIHZhbHVlIHdp
dGhvdXQgaGF2aW5nDQo+IHRvIGxvb2t1cCB0aGUgZGVjbGFyYXRpb24gb2YgdGhlIHN0cnVjdC4g
QW5kIGl0J3MgYWxzbyBtb3JlIHJvYnVzdA0KPiBhZ2FpbnN0IGNoYW5nZXMgdG8gdGhlIHN0cnVj
dCBkZWZpbml0aW9uLg0KPiANCj4gVGhlIG1lbnRpb25lZCByb2J1c3RuZXNzIGlzIHJlbGV2YW50
IGZvciBhIHBsYW5uZWQgY2hhbmdlIHRvIHN0cnVjdA0KPiBpMmNfZGV2aWNlX2lkIHRoYXQgcmVw
bGFjZXMgLmRyaXZlcl9kYXRhIGJ5IGFuIGFub255bW91cyB1bmlvbi4NCj4gDQo+IFdoaWxlIHRv
dWNoaW5nIGFsbCB0aGVzZSBhcnJheXMsIHVuaWZ5IHVzYWdlIG9mIHdoaXRlc3BhY2UgYW5kIGNv
bW1hcy4NCj4gDQo+IFRoaXMgcGF0Y2ggZG9lc24ndCBtb2RpZnkgdGhlIGNvbXBpbGVkIGFycmF5
cywgb25seSB0aGVpciByZXByZXNlbnRhdGlvbg0KPiBpbiBzb3VyY2UgZm9ybSBiZW5lZml0cy4g
VGhlIGZvcm1lciB3YXMgY29uZmlybWVkIHdpdGggeDg2IGFuZCBhcm02NA0KPiBidWlsZHMuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyAoVGhlIENhcGFibGUgSHViKSA8
dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4NCg0KTEdUTSwNClJldmlld2VkLWJ5OiBBbGV4
YW5kZXIgU3ZlcmRsaW4gPGFsZXhhbmRlci5zdmVyZGxpbkBzaWVtZW5zLmNvbT4NCg0KPiAtLS0N
Cj4gSGVsbG8sDQo+IA0KPiB0aGUgbWVudGlvbmVkIGNoYW5nZSB0byBpMmNfZGV2aWNlX2lkIGlz
IHRoZSBmb2xsb3dpbmc6DQo+IA0KPiAJZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW9kX2Rl
dmljZXRhYmxlLmggYi9pbmNsdWRlL2xpbnV4L21vZF9kZXZpY2V0YWJsZS5oDQo+IAlpbmRleCAy
M2ZmMjQwODBkZmQuLmFlYmQzYTVlOTBhZiAxMDA2NDQNCj4gCS0tLSBhL2luY2x1ZGUvbGludXgv
bW9kX2RldmljZXRhYmxlLmgNCj4gCSsrKyBiL2luY2x1ZGUvbGludXgvbW9kX2RldmljZXRhYmxl
LmgNCj4gCUBAIC00NzcsNyArNDc3LDExIEBAIHN0cnVjdCBycG1zZ19kZXZpY2VfaWQgew0KPiAJ
DQo+IAkgc3RydWN0IGkyY19kZXZpY2VfaWQgew0KPiAJwqAJY2hhciBuYW1lW0kyQ19OQU1FX1NJ
WkVdOw0KPiAJLQlrZXJuZWxfdWxvbmdfdCBkcml2ZXJfZGF0YTvCoMKgwqDCoCAvKiBEYXRhIHBy
aXZhdGUgdG8gdGhlIGRyaXZlciAqLw0KPiAJKwl1bmlvbiB7DQo+IAkrCQkvKiBEYXRhIHByaXZh
dGUgdG8gdGhlIGRyaXZlciAqLw0KPiAJKwkJa2VybmVsX3Vsb25nX3QgZHJpdmVyX2RhdGE7DQo+
IAkrCQljb25zdCB2b2lkICpkcml2ZXJfZGF0YV9wdHI7DQo+IAkrCX07DQo+IAkgfTsNCj4gCQ0K
PiAJIC8qIHBjaV9lcGYgKi8NCj4gDQo+IGFuZCB0aGlzIHJlcXVpcmVzIHRoYXQgLmRyaXZlcl9k
YXRhIGlzIGFzc2lnbmVkIHZpYSBhIG5hbWVkIGluaXRpYWxpemVyDQo+IGZvciBzdGF0aWMgZGF0
YS4gVGhpcyByZXF1aXJlbWVudCBpc24ndCBhIGJhZCBvbmUgYmVjYXVzZSBuYW1lZA0KPiBpbml0
aWFsaXplcnMgYXJlIGFsc28gbXVjaCBiZXR0ZXIgcmVhZGFibGUgdGhhbiBsaXN0IGluaXRpYWxp
emVycy4NCj4gDQo+IFRoZSB1bmlvbiBhZGRlZCB0byBzdHJ1Y3QgaTJjX2RldmljZV9pZCBlbmFi
bGVzIGZ1cnRoZXIgY2xlYW51cHMgbGlrZToNCj4gDQo+IAlkaWZmIC0tZ2l0IGEvZHJpdmVycy9y
ZWd1bGF0b3IvYWQ1Mzk4LmMgYi9kcml2ZXJzL3JlZ3VsYXRvci9hZDUzOTguYw0KPiAJaW5kZXgg
MDEyM2NhODE1N2E4Li5kZmIwYjA3NTAwYTcgMTAwNjQ0DQo+IAktLS0gYS9kcml2ZXJzL3JlZ3Vs
YXRvci9hZDUzOTguYw0KPiAJKysrIGIvZHJpdmVycy9yZWd1bGF0b3IvYWQ1Mzk4LmMNCj4gCUBA
IC0yMDcsOCArMjA3LDggQEAgc3RydWN0IGFkNTM5OF9jdXJyZW50X2RhdGFfZm9ybWF0IHsNCj4g
CSBzdGF0aWMgY29uc3Qgc3RydWN0IGFkNTM5OF9jdXJyZW50X2RhdGFfZm9ybWF0IGRmXzEwXzRf
MTIwID0gezEwLCA0LCAwLCAxMjAwMDB9Ow0KPiAJDQo+IAkgc3RhdGljIGNvbnN0IHN0cnVjdCBp
MmNfZGV2aWNlX2lkIGFkNTM5OF9pZFtdID0gew0KPiAJLQl7IC5uYW1lID0gImFkNTM5OCIsIC5k
cml2ZXJfZGF0YSA9IChrZXJuZWxfdWxvbmdfdCkmZGZfMTBfNF8xMjAgfSwNCj4gCS0JeyAubmFt
ZSA9ICJhZDU4MjEiLCAuZHJpdmVyX2RhdGEgPSAoa2VybmVsX3Vsb25nX3QpJmRmXzEwXzRfMTIw
IH0sDQo+IAkrCXsgLm5hbWUgPSAiYWQ1Mzk4IiwgLmRyaXZlcl9kYXRhX3B0ciA9ICZkZl8xMF80
XzEyMCB9LA0KPiAJKwl7IC5uYW1lID0gImFkNTgyMSIsIC5kcml2ZXJfZGF0YV9wdHIgPSAmZGZf
MTBfNF8xMjAgfSwNCj4gCcKgCXsgfQ0KPiAJIH07DQo+IAkgTU9EVUxFX0RFVklDRV9UQUJMRShp
MmMsIGFkNTM5OF9pZCk7DQo+IAlAQCAtMjE5LDggKzIxOSw3IEBAIHN0YXRpYyBpbnQgYWQ1Mzk4
X3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICpjbGllbnQpDQo+IAnCoAlzdHJ1Y3QgcmVndWxhdG9y
X2luaXRfZGF0YSAqaW5pdF9kYXRhID0gZGV2X2dldF9wbGF0ZGF0YSgmY2xpZW50LT5kZXYpOw0K
PiAJwqAJc3RydWN0IHJlZ3VsYXRvcl9jb25maWcgY29uZmlnID0geyB9Ow0KPiAJwqAJc3RydWN0
IGFkNTM5OF9jaGlwX2luZm8gKmNoaXA7DQo+IAktCWNvbnN0IHN0cnVjdCBhZDUzOThfY3VycmVu
dF9kYXRhX2Zvcm1hdCAqZGYgPQ0KPiAJLQnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
KHN0cnVjdCBhZDUzOThfY3VycmVudF9kYXRhX2Zvcm1hdCAqKWlkLT5kcml2ZXJfZGF0YTsNCj4g
CSsJY29uc3Qgc3RydWN0IGFkNTM5OF9jdXJyZW50X2RhdGFfZm9ybWF0ICpkZiA9IGlkLT5kcml2
ZXJfZGF0YTsNCj4gCQ0KPiAJwqAJY2hpcCA9IGRldm1fa3phbGxvYygmY2xpZW50LT5kZXYsIHNp
emVvZigqY2hpcCksIEdGUF9LRVJORUwpOw0KPiAJwqAJaWYgKCFjaGlwKQ0KPiANCj4gdGhhdCBh
cmUgYW4gaW1wcm92ZW1lbnQgZm9yIHJlYWRhYmlsaXR5IChhZ2FpbiEpIGFuZCBpdCBrZWVwcyBz
b21lDQo+IHByb3BlcnRpZXMgb2YgdGhlIHBvaW50ZXJzIChoZXJlOiBiZWluZyBjb25zdCkgd2l0
aG91dCBoYXZpbmcgdG8gcGF5DQo+IGF0dGVudGlvbiBmb3IgdGhhdC4gKEkgZGlkbid0IGZpbmQg
YSBuaWNlIGxlZCBkcml2ZXIgdGhhdCBiZW5lZml0cywgc28NCj4gdGhpcyBpcyAib25seSIgYSBy
ZWd1bGF0b3IgZHJpdmVyIGV4YW1wbGUuKQ0KPiANCj4gTXkgYWRkaXRpb25hbCBtb3RpdmF0aW9u
IGZvciB0aGlzIGVmZm9ydCBpcyBDSEVSSVsxXS4gVGhpcyBpcyBhIGhhcmR3YXJlDQo+IGV4dGVu
c2lvbiB0aGF0IHVzZXMgMTI4IGJpdCBwb2ludGVycyBidXQgdW5zaWduZWQgbG9uZyBpcyBzdGls
bCA2NCBiaXQuDQo+IFNvIHdpdGggQ0hFUkkgeW91IGNhbm5vdCBzdG9yZSBwb2ludGVycyBpbiB1
bnNpZ25lZCBsb25nIHZhcmlhYmxlcy4NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBVd2UNCj4gDQo+
IMKgZHJpdmVycy9sZWRzL2ZsYXNoL2xlZHMtYXMzNjQ1YS5jIHzCoCAyICstDQo+IMKgZHJpdmVy
cy9sZWRzL2ZsYXNoL2xlZHMtbG0zNjAxeC5jIHzCoCA0ICsrLS0NCj4gwqBkcml2ZXJzL2xlZHMv
bGVkcy1hbjMwMjU5YS5jwqDCoMKgwqDCoCB8wqAgMiArLQ0KPiDCoGRyaXZlcnMvbGVkcy9sZWRz
LWF3MjAweHguY8KgwqDCoMKgwqDCoCB8IDEwICsrKysrLS0tLS0NCj4gwqBkcml2ZXJzL2xlZHMv
bGVkcy1iZDI4MDIuY8KgwqDCoMKgwqDCoMKgIHzCoCAyICstDQo+IMKgZHJpdmVycy9sZWRzL2xl
ZHMtYmxpbmttLmPCoMKgwqDCoMKgwqDCoCB8wqAgNCArKy0tDQo+IMKgZHJpdmVycy9sZWRzL2xl
ZHMtaXMzMWZsMzE5eC5jwqDCoMKgIHwgMjIgKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiDCoGRy
aXZlcnMvbGVkcy9sZWRzLWlzMzFmbDMyeHguY8KgwqDCoCB8IDE4ICsrKysrKysrKy0tLS0tLS0t
LQ0KPiDCoGRyaXZlcnMvbGVkcy9sZWRzLWxtMzUzMC5jwqDCoMKgwqDCoMKgwqAgfMKgIDQgKyst
LQ0KPiDCoGRyaXZlcnMvbGVkcy9sZWRzLWxtMzUzMi5jwqDCoMKgwqDCoMKgwqAgfMKgIDQgKyst
LQ0KPiDCoGRyaXZlcnMvbGVkcy9sZWRzLWxtMzU1eC5jwqDCoMKgwqDCoMKgwqAgfMKgIDYgKysr
LS0tDQo+IMKgZHJpdmVycy9sZWRzL2xlZHMtbG0zNjQyLmPCoMKgwqDCoMKgwqDCoCB8wqAgNCAr
Ky0tDQo+IMKgZHJpdmVycy9sZWRzL2xlZHMtbG0zNjkyeC5jwqDCoMKgwqDCoMKgIHzCoCA0ICsr
LS0NCj4gwqBkcml2ZXJzL2xlZHMvbGVkcy1sbTM2OTcuY8KgwqDCoMKgwqDCoMKgIHzCoCAyICst
DQo+IMKgZHJpdmVycy9sZWRzL2xlZHMtbHAzOTQ0LmPCoMKgwqDCoMKgwqDCoCB8wqAgNCArKy0t
DQo+IMKgZHJpdmVycy9sZWRzL2xlZHMtbHAzOTUyLmPCoMKgwqDCoMKgwqDCoCB8wqAgNCArKy0t
DQo+IMKgZHJpdmVycy9sZWRzL2xlZHMtbHA1MHh4LmPCoMKgwqDCoMKgwqDCoCB8IDEyICsrKysr
Ky0tLS0tLQ0KPiDCoGRyaXZlcnMvbGVkcy9sZWRzLWxwNTUyMS5jwqDCoMKgwqDCoMKgwqAgfMKg
IDIgKy0NCj4gwqBkcml2ZXJzL2xlZHMvbGVkcy1scDU1MjMuY8KgwqDCoMKgwqDCoMKgIHzCoCA0
ICsrLS0NCj4gwqBkcml2ZXJzL2xlZHMvbGVkcy1scDU1NjIuY8KgwqDCoMKgwqDCoMKgIHzCoCAy
ICstDQo+IMKgZHJpdmVycy9sZWRzL2xlZHMtbHA1NTY5LmPCoMKgwqDCoMKgwqDCoCB8wqAgMiAr
LQ0KPiDCoGRyaXZlcnMvbGVkcy9sZWRzLWxwODUwMS5jwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0N
Cj4gwqBkcml2ZXJzL2xlZHMvbGVkcy1scDg4NjAuY8KgwqDCoMKgwqDCoMKgIHzCoCAyICstDQo+
IMKgZHJpdmVycy9sZWRzL2xlZHMtbHA4ODY0LmPCoMKgwqDCoMKgwqDCoCB8wqAgNCArKy0tDQo+
IMKgZHJpdmVycy9sZWRzL2xlZHMtcGNhOTUzMi5jwqDCoMKgwqDCoMKgIHzCoCA4ICsrKystLS0t
DQo+IMKgZHJpdmVycy9sZWRzL2xlZHMtcGNhOTU1eC5jwqDCoMKgwqDCoMKgIHwgMTIgKysrKysr
LS0tLS0tDQo+IMKgZHJpdmVycy9sZWRzL2xlZHMtcGNhOTYzeC5jwqDCoMKgwqDCoMKgIHzCoCA4
ICsrKystLS0tDQo+IMKgZHJpdmVycy9sZWRzL2xlZHMtcGNhOTk1eC5jwqDCoMKgwqDCoMKgIHzC
oCA4ICsrKystLS0tDQo+IMKgZHJpdmVycy9sZWRzL2xlZHMtc3QxMjAyLmPCoMKgwqDCoMKgwqDC
oCB8wqAgMiArLQ0KPiDCoGRyaXZlcnMvbGVkcy9sZWRzLXRjYTY1MDcuY8KgwqDCoMKgwqDCoCB8
wqAgMiArLQ0KPiDCoGRyaXZlcnMvbGVkcy9sZWRzLXRsYzU5MXh4LmPCoMKgwqDCoMKgIHzCoCA2
ICsrKy0tLQ0KPiDCoGRyaXZlcnMvbGVkcy9sZWRzLXR1cnJpcy1vbW5pYS5jwqAgfMKgIDIgKy0N
Cj4gwqBkcml2ZXJzL2xlZHMvcmdiL2xlZHMta3RkMjAyeC5jwqDCoCB8wqAgNiArKystLS0NCj4g
wqAzMyBmaWxlcyBjaGFuZ2VkLCA5MCBpbnNlcnRpb25zKCspLCA5MCBkZWxldGlvbnMoLSkNCg0K
LS0gDQpBbGV4YW5kZXIgU3ZlcmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K

